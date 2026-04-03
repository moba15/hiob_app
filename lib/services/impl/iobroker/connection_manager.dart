import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' hide ConnectionState;
import 'package:grpc/grpc.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/generated/config_sync/config_sync.pbgrpc.dart';
import 'package:smart_home/generated/login/login.pbgrpc.dart';
import 'package:smart_home/generated/state/state.pbgrpc.dart';
import 'package:smart_home/repository/general_repository.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/services/connection/connection_service_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/utils/cryptojs_aes_encryption_helper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class IoBrokerConnectionService
    with WidgetsBindingObserver
    implements ConnectionServiceInterface {
  static const Duration _retryDelay = Duration(seconds: 3);

  /// Static so it can be used by the background runner
  static Map<String, dynamic> decryptAes({
    required Map<String, dynamic> rawMap,
    required String secureKey,
    StreamController<ConnectionStatus>? connectionStatusStreamController,
    Function? onError,
  }) {
    String pass = rawMap["type"];
    if (secureKey.isNotEmpty && rawMap["content"].runtimeType == String) {
      pass = secureKey + pass;
      try {
        rawMap["content"] = jsonDecode(
          decryptAESCryptoJS(rawMap["content"], pass),
        );
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
  ConfigSyncClient? configSyncStub;

  final StreamController statusStreamController = StreamController();
  final DeviceServiceInterface deviceManager;
  final GeneralRepository generalManager;
  final IoBrokerManager ioBrokerManager;
  final LoggingService loggingService;
  final List<DataPackage> sendOnConnect = [];

  final StreamController<ConnectionStatus> connectionStatusStreamController =
      StreamController.broadcast();
  int tries = 0;

  IoBrokerConnectionService({
    required this.deviceManager,
    required this.ioBrokerManager,
    required this.generalManager,
    required this.loggingService,
  }) {
    WidgetsBinding.instance.addObserver(this);
    connectionStatusStreamController.stream.listen((event) {
      connectionStatus = event;
    });
  }

  @override
  Future<Uri> getUrl() async {
    if (ioBrokerManager.useSecondaryAddress &&
        (await networkInfo.getWifiName()).toString().trim() !=
            ("\"${ioBrokerManager.knownNetwork.trim()}\"")) {
      return Uri.parse(ioBrokerManager.secondaryAddress);
    }
    return Uri.parse(
      "${ioBrokerManager.useSecureConnection ? "wss://" : "ws://"}${ioBrokerManager.mainIp}:${ioBrokerManager.port}",
    );
  }

  @override
  Future<void> connect() async {
    Uri url = await getUrl();
    await channel?.shutdown();
    channel = ClientChannel(
      url.host,
      port: url.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    loginClientStub = LoginClient(channel!);
    configSyncStub = ConfigSyncClient(channel!);

    channel!.onConnectionStateChanged.listen((event) {
      loggingService.debug(
        "ConnectionManager | onConnectionStateChanged | ${event.name}",
      );
      if (event == ConnectionState.transientFailure) {
        changeConnectionStatus(ConnectionStatus.error);
      }
    });

    channel!.createConnection();

    _requestLogin();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;

      case AppLifecycleState.inactive:
        break;

      case AppLifecycleState.paused:
        disconnect();

        break;
      case AppLifecycleState.resumed:
        if (!ioBConnected) {
          tries = 0;
          // reconnect();
        }
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.

        break;
    }
  }

  @override
  void reconnect({bool delayed = true}) async {
    if (delayed) {
      await Future.delayed(_retryDelay);
    }

    // ignore: dead_code
    Uri url = await getUrl();
    tries++;
    if (tries > 10) {
      loggingService.debug(
        "ConnectionManager | reconnect | More than 10 tries, not reconnecting",
      );

      channel?.shutdown();
      return;
    }
    changeConnectionStatus(ConnectionStatus.connecting);
    loggingService.debug("ConnectionManager | reconnect | reconnecting");
    await channel?.shutdown();
    channel = ClientChannel(
      url.host,
      port: url.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    loginClientStub = LoginClient(channel!);

    channel!.onConnectionStateChanged.listen((event) {
      loggingService.debug(
        "ConnectionManager | onConnectionStateChanged | ${event.name}",
      );
      if (event == ConnectionState.transientFailure) {
        changeConnectionStatus(ConnectionStatus.error);
        channel?.shutdown();
      }
    });

    channel!.createConnection();

    _requestLogin();
  }

  @override
  void disconnect() async {
    await _webSocketStreamSub?.cancel();
    await _webSocket?.sink.close();
    connectionStatusStreamController.add(ConnectionStatus.disconnected);
    ioBConnected = false;
  }

  void _requestLogin() async {
    loggingService.debug(
      "ConnectionManager | Request login ${generalManager.deviceName}:${generalManager.deviceID}",
    );
    connectionStatusStreamController.add(ConnectionStatus.loggingIn);
    try {
      final LoginResponse response = await loginClientStub!
          .login(
            LoginRequest(
              deviceId: generalManager.deviceID,
              deviceName: generalManager.deviceName,
              key: generalManager.loginKey,
              password: ioBrokerManager.password,
              user: ioBrokerManager.user,
            ),
          )
          .timeout(_retryDelay);
      if (response.status == LoginResponse_Status.error) {
        loggingService.error(
          "ConnectionManager | Login error: ${response.errorMsg}",
          response.errorMsg,
        );
        changeConnectionStatus(ConnectionStatus.error);
        return;
      }

      if (response.status != LoginResponse_Status.succesfull) {
        _onLoginDeclined(response.status);
      } else {
        _onLoginApproved("");
      }
    } on TimeoutException catch (e) {
      loggingService.error(
        "ConnectionManager | Login timeout after ${_retryDelay.inSeconds}s",
        e,
      );
      changeConnectionStatus(ConnectionStatus.tryAgain);
    } catch (e) {
      loggingService.error("ConnectionManager | errorLogin", e);
      changeConnectionStatus(ConnectionStatus.error);
      generalManager.dialogStreamController.sink.add(
        (p0) => AlertDialog(
          title: const Text("Error"),
          content: const Text(
            "Could not connect to the backend. Make sure you installed the newest Hiob adapter",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(p0).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void _onLoginDeclined(LoginResponse_Status status) {
    loggingService.debug("ConnectionManager | Login declined ${status.name}");

    _requestApproval();

    connectionStatusStreamController.add(ConnectionStatus.loginDeclined);
  }

  @override
  void changeConnectionStatus(ConnectionStatus status, {String? message}) {
    loggingService.debug(
      "ConnectionManager | Change connection status to ${status.name}",
    );
    connectionStatusStreamController.add(status);
    if (!status.isConnected && status != ConnectionStatus.connecting) {
      reconnect();
    }
  }

  void _requestApproval() async {
    loggingService.debug("ConnectionManager | Requesting approval");
    ApprovalResponse response = await loginClientStub!.requestApproval(
      ApprovalRequest(
        deviceId: generalManager.deviceID,
        deviceName: generalManager.deviceName,
      ),
    );
    if (response.status == ApprovalResponse_Status.timeout) {
      loggingService.debug("ConnectionManager | Requesting approval: timeout");
    } else if (response.status == ApprovalResponse_Status.aprroved) {
      loggingService.debug(
        "ConnectionManager | Requesting approval: successfull",
      );
      _onLoginKey(response.key);
    }
  }

  void _onLoginApproved(String? version) {
    loggingService.debug("ConnectionManager | Login approved");

    _registerOtherServices();
    connectionStatusStreamController.add(ConnectionStatus.loggedIn);
    deviceManager.listenToDeviceChanges();
    deviceManager.fetchAndUpdateDevices();
    deviceManager.listenToDeviceChanges();
  }

  void _onLoginKey(String? key) {
    if (key == null) {
      return;
    }
    loggingService.debug("ConnectionManager | Uodate login key");

    generalManager.updateLoginKey(key);
    _requestLogin();
  }

  void _registerOtherServices() {
    loggingService.debug("ConnectionManager | Regiserting other services");
    if (stateUpdateClientStub != null) {}
    Map<String, String> header = {
      "token": generalManager.loginKey ?? "",
      "deviceId": generalManager.deviceID ?? "",
    };
    stateUpdateClientStub = StateUpdateClient(
      channel!,
      options: CallOptions(metadata: header),
    );
    configSyncStub = ConfigSyncClient(
      channel!,
      options: CallOptions(metadata: header),
    );
  }

  @override
  ConnectionStatus getConnectionStatus() {
    return connectionStatus;
  }

  @override
  T getGrpcClient<T>() {
    if (T == LoginClient) {
      if (loginClientStub == null) {
        throw Exception("LoginClient is not initialized");
      }
      return loginClientStub as T;
    } else if (T == StateUpdateClient) {
      if (stateUpdateClientStub == null) {
        throw Exception("StateUpdateClient is not initialized");
      }
      return stateUpdateClientStub as T;
    } else if (T == ConfigSyncClient) {
      if (configSyncStub == null) {
        throw Exception("ConfigSyncClient is not initialized");
      }
      return configSyncStub as T;
    } else {
      throw UnimplementedError("gRPC service of type $T is not implemented");
    }
  }

  @override
  Stream<ConnectionStatus> get connectionStatusStream =>
      connectionStatusStreamController.stream;
}
