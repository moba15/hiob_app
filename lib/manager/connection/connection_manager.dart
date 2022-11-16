import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

enum ConnectionStatus {
  disconnected,connected, loggedIn,waiting, loggingIn, connecting, tryAgain, error, loginDeclined
}


class ConnectionManager with WidgetsBindingObserver {
  bool ioBConnected = false;

  ConnectionStatus connectionStatus = ConnectionStatus.disconnected;




  Socket? socket;
  WebSocketChannel? _webSocket;
  StreamSubscription? _webSocketStreamSub;
  final StreamController statusStreamController = StreamController();
  final DeviceManager deviceManager;
  final GeneralManager generalManager;
  final IoBrokerManager ioBrokerManager;
  final List<DataPackage> sendOnConnect = [];

  final StreamController<ConnectionStatus> connectionStatusStreamController = StreamController.broadcast(); //TODO: Kein Broadcast
  int tries = 0;
  ConnectionManager(
      {required this.deviceManager, required this.ioBrokerManager, required this.generalManager}) {
    WidgetsBinding.instance.addObserver(this);
    connectionStatusStreamController.stream.listen((event) {connectionStatus = event;});
  }

  Future<void> connectIoB() async {
    
    
    try {
      _webSocket =  IOWebSocketChannel.connect(Uri.parse("ws://" + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString()), pingInterval: const Duration(minutes: 5));
      _webSocketStreamSub = _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);


    } catch(e) {
      connectionStatusStreamController.addError("Connection failed");
    } finally {
      statusStreamController.add(true);
      statusStreamController.close();
    }



  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        close();
        break;
      case AppLifecycleState.resumed:
        if(!ioBConnected) {
          tries = 0;

          reconnect();
        }
        break;
    }
  }


  void onError(e) {

    ioBConnected = false;
    ioBrokerManager.connected = true;

  }

  void reconnect() async {
    connectionStatusStreamController.add(ConnectionStatus.tryAgain);
    if(_webSocketStreamSub != null) {
      _webSocketStreamSub!.cancel();
    }
    if(_webSocket != null) {
      _webSocket?.sink.close(status.goingAway);
    }
    _webSocket = null;

    ioBrokerManager.connected = false;

    try {
      _webSocket =  IOWebSocketChannel.connect(Uri.parse("ws://" + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString()));
      _webSocketStreamSub = _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);

    } catch(e) {
      ioBrokerManager.connected = false;

      connectionStatusStreamController.add(ConnectionStatus.error);

      _webSocket = null;
      _webSocketStreamSub = null;
    }

  }

  void onData(event) {
    if (kDebugMode) {
      print(event);
    }
    readPackage(event);
  }

  void close()  async {
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
    if(tries<=20) {
      connectionStatusStreamController.add(ConnectionStatus.tryAgain);
      await Future.delayed(const Duration(seconds: 3));
      reconnect();
    }



  }

  void readPackage(String msg) {
    //TODO Error Handling
      Map<String, dynamic> rawMap = jsonDecode(msg);
      DataPackageType packageType = DataPackageType.values
          .firstWhere((element) => element.name == rawMap["type"]);
      switch (packageType) {
        case DataPackageType.iobStateChanged:
          stateChangedPackage(
              objectID: rawMap["objectID"], value: rawMap["value"]);
          break;
        case DataPackageType.enumUpdate:
          ioBrokerManager.enumUpdate(rawData: rawMap);
          break;
        case DataPackageType.firstPingFromIob:
          _onFirstPing();
          break;
        case DataPackageType.historyDataUpdate:
          Manager.instance!.historyManager.onHistoryUpdate(data: jsonDecode( rawMap["data"]));
          break;
        case DataPackageType.loginDeclined:
          _onLoginDeclined();
          break;
        case DataPackageType.loginApproved:
          _onLoginApproved();
          break;
        case DataPackageType.loginKey:
          print("Key");
          _onLoginKey(rawMap["key"]);
          break;

        default:
          throw UnimplementedError("Error");
      }

  }

  void stateChangedPackage({required String objectID, required dynamic value}) {
    List<DataPoint>? iobDataPoints =
        deviceManager.getIoBrokerDataPointsByObjectID(objectID);
    for(DataPoint dataPoint in iobDataPoints ?? []) {
      deviceManager.valueChange(dataPoint, value);
    }
  }

  void _onFirstPing() {
    ioBConnected = true;

    ioBrokerManager.connected = true;
    connectionStatusStreamController.add(ConnectionStatus.connected);
    tries = 0;
    _requestLogin();

    for(DataPackage d in sendOnConnect) {
      sendMsg(d);
    }
  }

  void _requestLogin() async {
    connectionStatusStreamController.add(ConnectionStatus.loggingIn);
    sendMsg(RequestLoginPackage(deviceName: generalManager.deviceName, deviceID: generalManager.deviceID, key: generalManager.loginKey));
  }
  
  
  void _onLoginDeclined() {
    connectionStatusStreamController.add(ConnectionStatus.loginDeclined);
  }

  void _onLoginApproved() {

    connectionStatusStreamController.add(ConnectionStatus.loggedIn);
    deviceManager.subscribeToDataPointsIoB(this);
  }
  
  void _onLoginKey(String? key) {
    print("Login key: " + key.toString());
    if(key == null) {
      return;
    }
    
    generalManager.updateLoginKey(key);
    _requestLogin();

  }

  void sendMsg(DataPackage dataPackage) {

    if(!ioBConnected) {
      if(dataPackage.type == DataPackageType.subscribeHistory) {
        sendOnConnect.add(dataPackage);
      }
      return;
    }
    _webSocket?.sink.add(jsonEncode({"type": dataPackage.type.name, "content": dataPackage.content}));
  }
  
  
  
}
