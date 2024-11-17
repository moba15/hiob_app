import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/generated/login/login.pbgrpc.dart';
import 'package:smart_home/generated/state/state.pbgrpc.dart';
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
  ClientChannel? channel;
  LoginClient? loginClientStub;
  StateUpdateClient? stateUpdateClientStub;

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
    channel = ClientChannel(url.host,
        port: url.port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    loginClientStub = LoginClient(channel!,
        options: CallOptions(metadata: {"x-auth": "asdasdasdasd"}));
    channel!.onConnectionStateChanged.listen(
      (event) {
        Manager().talker.debug(
            "ConnectionManager | onConnectionStateChanged | ${event.name}");
      },
    );

    channel!.createConnection();

    _requestLogin();
    /*try {
      _webSocket = IOWebSocketChannel.connect(url,
          pingInterval: const Duration(minutes: 5));
      _webSocketStreamSub =
          _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);
    } catch (e) {
      connectionStatusStreamController.addError("Connection failed");
    } finally {
      statusStreamController.add(true);
      statusStreamController.close();
    }*/
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

  void onError(e) async {
    ioBConnected = false;
    ioBrokerManager.connected = true;
    Manager().talker.error("ConnectionManager | onError ", e);
  }

  void reconnect() async {
    // ignore: dead_code
    Uri url = await getUrl();

    await Future.delayed(const Duration(seconds: 2));
    tries++;
    if (tries > 10) {
      Manager().talker.debug(
          "ConnectionManager | reconnect | More than 10 tries, not reconnecting");
      return;
    }
    Manager().talker.debug("ConnectionManager | reconnect | reconnecting");

    channel = ClientChannel(url.host,
        port: url.port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    loginClientStub = LoginClient(channel!);
    channel!.onConnectionStateChanged.listen(
      (event) {
        Manager().talker.debug(
            "ConnectionManager | onConnectionStateChanged | ${event.name}");
      },
    );

    channel!.createConnection();

    _requestLogin();
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
    Manager().talker.debug(
        "ConnectionManager | Recieved package ${packageType.name} | ${jsonEncode(rawMap)}");
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
        //_onLoginDeclined();
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
    Manager().talker.debug(
        "ConnectionManager | Request login ${generalManager.deviceName}:${generalManager.deviceID}");
    connectionStatusStreamController.add(ConnectionStatus.loggingIn);

    LoginResponse response = await loginClientStub!
        .login(LoginRequest(
            deviceId: generalManager.deviceID,
            deviceName: generalManager.deviceName,
            key: generalManager.loginKey,
            password: ioBrokerManager.password,
            user: ioBrokerManager.user))
        .catchError((Object e) async {
      Manager().talker.error("ConnectionManager | errorLogin", e);
    });

    if (response.status != LoginResponse_Status.succesfull) {
      _onLoginDeclined(response.status);
    } else {
      _onLoginApproved("");
    }
  }

  void _onLoginDeclined(LoginResponse_Status status) {
    Manager().talker.debug("ConnectionManager | Login declined ${status.name}");

    _requestApproval();

    connectionStatusStreamController.add(ConnectionStatus.loginDeclined);
  }

  void _requestApproval() async {
    Manager().talker.debug("ConnectionManager | Requesting approval");
    ApprovalResponse response = await loginClientStub!.requestApproval(
        ApprovalRequest(
            deviceId: generalManager.deviceID,
            deviceName: generalManager.deviceName));
    if (response.status == ApprovalResponse_Status.timeout) {
      Manager()
          .talker
          .debug("ConnectionManager | Requesting approval: timeout");
    } else if (response.status == ApprovalResponse_Status.aprroved) {
      Manager()
          .talker
          .debug("ConnectionManager | Requesting approval: successfull");
      _onLoginKey(response.key);
    }
  }

  void _onNewAes() {
    connectionStatusStreamController.add(ConnectionStatus.newAesKey);
  }

  void _onWrongAesKey() {
    connectionStatusStreamController.add(ConnectionStatus.emptyAES);
  }

  void _onLoginApproved(String? version) {
    Manager().talker.debug("ConnectionManager | Login approved");

    _registerOtherServices();
    connectionStatusStreamController.add(ConnectionStatus.loggedIn);
    deviceManager.subscribeToDataPointsIoB(this);
  }

  void _onLoginKey(String? key) {
    if (key == null) {
      return;
    }
    Manager().talker.debug("ConnectionManager | Uodate login key");

    generalManager.updateLoginKey(key);
    _requestLogin();
  }

  void _registerOtherServices() {
    Manager().talker.debug("ConnectionManager | Regiserting other services");
    if (stateUpdateClientStub != null) {
      //TODO clean
    }
    Map<String, String> header = {
      "token": generalManager.loginKey ?? "",
      "deviceId": generalManager.deviceID ?? ""
    };
    stateUpdateClientStub =
        StateUpdateClient(channel!, options: CallOptions(metadata: header));
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
