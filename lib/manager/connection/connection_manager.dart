import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/utils/cryptojs_aes_encryption_helper.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

enum ConnectionStatus {
  disconnected,
  connected,
  loggedIn,
  emptyAES,
  waiting,
  loggingIn,
  connecting,
  tryAgain,
  error,
  loginDeclined,
  newAesKey,
  wrongAesKey,
  wrongAdapterVersion
}

extension ConnectionStatusExtension on ConnectionStatus {
  bool get isConnected {
    return this == ConnectionStatus.connected ||
        this == ConnectionStatus.loggedIn;
  }
}

class ConnectionManager with WidgetsBindingObserver {
  /// Static so it can be used by the background runner
  static Map<String, dynamic> decryptAes(
      {required Map<String, dynamic> rawMap,
      required String secureKey,
      StreamController<ConnectionStatus>? connectionStatusStreamController,
      Function? onError}) {
    String pass = rawMap["type"];
    if (secureKey.isNotEmpty && rawMap["content"].runtimeType == String) {
      pass = secureKey + pass;
      try {
        rawMap["content"] =
            jsonDecode(decryptAESCryptoJS(rawMap["content"], pass));
      } catch (e) {
        connectionStatusStreamController?.add(ConnectionStatus.emptyAES);
        if (onError != null) {
          onError();
        }
      } finally {
        print("Decrypt done!");
      }
    } else {
      connectionStatusStreamController?.add(ConnectionStatus.emptyAES);
    }
    return rawMap;
  }

  bool ioBConnected = false;

  ConnectionStatus connectionStatus = ConnectionStatus.disconnected;

  final networkInfo = NetworkInfo();
  Socket? socket;
  WebSocketChannel? _webSocket;
  StreamSubscription? _webSocketStreamSub;
  final StreamController statusStreamController = StreamController();
  final DeviceManager deviceManager;
  final GeneralManager generalManager;
  final IoBrokerManager ioBrokerManager;
  final List<DataPackage> sendOnConnect = [];

  final StreamController<ConnectionStatus> connectionStatusStreamController =
      StreamController.broadcast(); //TODO: Kein Broadcast
  int tries = 0;

  ConnectionManager(
      {required this.deviceManager,
      required this.ioBrokerManager,
      required this.generalManager}) {
    WidgetsBinding.instance.addObserver(this);
    connectionStatusStreamController.stream.listen((event) {
      connectionStatus = event;
    });
  }

  Future<Uri> getUrl() async {
    if (ioBrokerManager.useSecondaryAddress &&
        (await networkInfo.getWifiName()).toString().trim() !=
            ("\"${ioBrokerManager.knownNetwork.trim()}\"")) {
      return Uri.parse(ioBrokerManager.secondaryAddress);
    }
    return Uri.parse(
        "${ioBrokerManager.useSecureConnection ? "wss://" : "ws://"}${ioBrokerManager.mainIp}:${ioBrokerManager.port}");
  }

  Future<void> connectIoB() async {
    Uri url = await getUrl();
    try {
      _webSocket = IOWebSocketChannel.connect(url,
          pingInterval: const Duration(minutes: 5));
      _webSocketStreamSub =
          _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);
    } catch (e) {
      connectionStatusStreamController.addError("Connection failed");
    } finally {
      statusStreamController.add(true);
      statusStreamController.close();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;

      case AppLifecycleState.inactive:
        break;

      case AppLifecycleState.paused:
        close();

        break;
      case AppLifecycleState.resumed:
        if (!ioBConnected) {
          tries = 0;
          reconnect();
        }
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.

        break;
    }
  }

  void onError(e) {
    ioBConnected = false;
    ioBrokerManager.connected = true;
  }

  void reconnect() async {
    return;
    // ignore: dead_code
    Uri url = await getUrl();
    connectionStatusStreamController.add(ConnectionStatus.tryAgain);
    if (_webSocketStreamSub != null) {
      _webSocketStreamSub!.cancel();
    }
    if (_webSocket != null) {
      _webSocket?.sink.close(status.goingAway);
    }
    _webSocket = null;

    ioBrokerManager.connected = false;

    try {
      _webSocket = IOWebSocketChannel.connect(url,
          pingInterval: const Duration(minutes: 5));
      _webSocketStreamSub =
          _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);
    } catch (e) {
      ioBrokerManager.connected = false;

      connectionStatusStreamController.add(ConnectionStatus.error);

      _webSocket = null;
      _webSocketStreamSub = null;
    }
  }

  void onData(event) {
    readPackage(event);
  }

  void close() async {
    await _webSocketStreamSub?.cancel();
    await _webSocket?.sink.close();
    connectionStatusStreamController.add(ConnectionStatus.disconnected);
    ioBConnected = false;
  }

  void onDone() async {
    ioBrokerManager.connected = false;
    connectionStatusStreamController.add(ConnectionStatus.disconnected);

    ioBConnected = false;
    tries++;
    if (tries <= 20) {
      connectionStatusStreamController.add(ConnectionStatus.tryAgain);
      await Future.delayed(const Duration(seconds: 3));
      reconnect();
    }
  }

  void readPackage(String msg) {
    Map<String, dynamic> rawMap = jsonDecode(msg);
    if (ioBrokerManager.secureBox) {
      rawMap = decryptAes(
          rawMap: rawMap,
          secureKey: ioBrokerManager.secureKey,
          connectionStatusStreamController: connectionStatusStreamController,
          onError: () {
            generalManager.dialogStreamController.sink
                .add((p0) => const AlertDialog(
                      title: Text("Error"),
                      content: Text("Parse Error - Please check the AES Key!"),
                    ));
          });
    }
    //print(rawMap["content"]);
    DataPackageType packageType = DataPackageType.values
        .firstWhere((element) => element.name == rawMap["type"]);
    if (rawMap["content"] == null) {
      //Give the user information that they need a new version (comp. with older vesions)
      _onWrongAdapterVersion();
      return;
    }
    //!Dirty quickfix for login error
    //Fix on Adapater side next time
    if (packageType == DataPackageType.loginKey &&
        rawMap["content"] is String) {
      _onLoginKey(rawMap["content"]);
      return;
    }
    rawMap = rawMap["content"];
    switch (packageType) {
      case DataPackageType.iobStateChanged:
        stateChangedPackage(
            objectID: rawMap["objectID"], value: rawMap["value"]);
        break;
      case DataPackageType.enumUpdate:
        ioBrokerManager.enumUpdate(rawData: rawMap);
        break;
      case DataPackageType.firstPingFromIob:
        generalManager.dialogStreamController.sink
            .add((p0) => const AlertDialog(
                  title: Text("Error"),
                  content:
                      Text("Make sure you installed the newest Hiob adapter"),
                ));
        break;
      case DataPackageType.firstPingFromIob2:
        _onFirstPing();
        break;
      case DataPackageType.setNewAes:
        _onNewAes();
        break;
      case DataPackageType.wrongAesKey:
        _onWrongAesKey();
        break;
      case DataPackageType.historyDataUpdate:
        Manager.instance.historyManager
            .onHistoryUpdate(data: jsonDecode(rawMap["data"]));
        break;
      case DataPackageType.loginDeclined:
        _onLoginDeclined();
        break;
      case DataPackageType.loginApproved:
        _onLoginApproved(rawMap["version"]);
        break;
      case DataPackageType.loginKey:
        _onLoginKey(rawMap["key"]);
        break;
      case DataPackageType.templateSettingCreate:
        _onTemplateSettingCreate();
        break;
      case DataPackageType.requestTemplatesSettings:
        Manager
            .instance.settingsSyncManager.fetchedConfigListStreamController.sink
            .add(List<String>.from(rawMap["settings"]));
        break;

      case DataPackageType.uploadTemplateSettingSuccess:
        Manager.instance.settingsSyncManager.uploadSuccessStreamController.sink
            .add(true);
        break;
      case DataPackageType.getTemplatesSetting:
        Manager.instance.settingsSyncManager.loadGotTemplate(
            rawMap["devices"], rawMap["screens"], rawMap["widget"]);
        break;
      case DataPackageType.answerSubscribeToDataPoints:
        _onAnswerSubscribeToDataPoints(rawMap["value"]);
        break;
      case DataPackageType.notification:
        Manager.instance.notificationManager
            .showIoBNotificationInForeground(rawMap["content"]);
        break;
      default:
        throw UnimplementedError("Error");
    }
  }

  void stateChangedPackage({required String objectID, required dynamic value}) {
    List<DataPoint>? iobDataPoints =
        deviceManager.getIoBrokerDataPointsByObjectID(objectID);
    for (DataPoint dataPoint in iobDataPoints ?? []) {
      deviceManager.valueChange(dataPoint, value);
    }
  }

  void _onAnswerSubscribeToDataPoints(List<dynamic>? dataValues) {
    if (dataValues != null) {
      for (Map<String, dynamic> dataValue in dataValues) {
        stateChangedPackage(
            objectID: dataValue["objectID"], value: dataValue["value"]);
      }
    }
  }

  void _onWrongAdapterVersion() {
    ioBConnected = true;
    ioBrokerManager.connected = true;
    connectionStatusStreamController.add(ConnectionStatus.wrongAdapterVersion);
  }

  void _onFirstPing() {
    ioBConnected = true;

    ioBrokerManager.connected = true;
    connectionStatusStreamController.add(ConnectionStatus.connected);
    tries = 0;
    _requestLogin();

    for (DataPackage d in sendOnConnect) {
      sendMsg(d);
    }
  }

  void _requestLogin() async {
    connectionStatusStreamController.add(ConnectionStatus.loggingIn);
    sendMsg(RequestLoginPackage(
        deviceName: generalManager.deviceName,
        deviceID: generalManager.deviceID,
        key: generalManager.loginKey,
        version: deviceManager.manager.versionNumber,
        password: ioBrokerManager.usePwd ? ioBrokerManager.password : null,
        user: ioBrokerManager.user));
  }

  void _onLoginDeclined() {
    connectionStatusStreamController.add(ConnectionStatus.loginDeclined);
  }

  void _onNewAes() {
    connectionStatusStreamController.add(ConnectionStatus.newAesKey);
  }

  void _onWrongAesKey() {
    connectionStatusStreamController.add(ConnectionStatus.emptyAES);
  }

  void _onLoginApproved(String? version) {
    connectionStatusStreamController.add(ConnectionStatus.loggedIn);
    deviceManager.subscribeToDataPointsIoB(this);
  }

  void _onLoginKey(String? key) {
    print(key);
    if (key == null) {
      return;
    }

    generalManager.updateLoginKey(key);
    _requestLogin();
  }

  void sendMsg(DataPackage dataPackage) {
    if (!ioBConnected) {
      if (dataPackage.type == DataPackageType.subscribeHistory) {
        sendOnConnect.add(dataPackage);
      }
      return;
    }
    String pass = dataPackage.type.name;
    dynamic sendContent = dataPackage.content;
    if (ioBrokerManager.secureBox) {
      if (ioBrokerManager.secureKey.isNotEmpty) {
        if (dataPackage.type.name != "requestLogin") {
          pass = ioBrokerManager.secureKey + pass;
        } else {
          pass = "tH8Lm-$pass";
        }
        sendContent = encryptAESCryptoJS(jsonEncode(dataPackage.content), pass);
      } else {
        connectionStatusStreamController.add(ConnectionStatus.emptyAES);
        return;
      }
    }
    _webSocket?.sink.add(
        jsonEncode({"type": dataPackage.type.name, "content": sendContent}));
  }

  void _onTemplateSettingCreate() {
    Manager.instance.settingsSyncManager.onTemplateCreate();
  }
}
