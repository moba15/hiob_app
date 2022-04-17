import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
class ConnectionManager with WidgetsBindingObserver {
  bool ioBConnected = false;
  Socket? socket;
  WebSocketChannel? _webSocket;
  StreamSubscription? _webSocketStreamSub;
  final StreamController statusStreamController = StreamController();
  final DeviceManager deviceManager;
  final IoBrokerManager ioBrokerManager;
  int tries = 0;
  ConnectionManager(
      {required this.deviceManager, required this.ioBrokerManager}) {
    WidgetsBinding.instance?.addObserver(this);
  }

  Future<void> connectIoB() async {
    
    
    try {
      _webSocket =  IOWebSocketChannel.connect(Uri.parse("ws://" + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString()), pingInterval: const Duration(minutes: 5));
      _webSocketStreamSub = _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);



    } catch(e) {
      ioBrokerManager.connectionStatusStreamController.addError("Connection failed");
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
      ioBrokerManager.connectionStatusStreamController.add(false);
      _webSocket = null;
      _webSocketStreamSub = null;
    }

  }

  void onData(event) {
    readPackage(event);
  }

  void close()  async {
    await _webSocketStreamSub?.cancel();
    await _webSocket?.sink.close();

    ioBConnected = false;
  }

  void onDone() async {
    ioBrokerManager.connected = false;
    ioBrokerManager.connectionStatusStreamController.add(false);
    ioBConnected = false;
    await Future.delayed(const Duration(seconds: 3));
    tries++;
    if(tries<=20) {
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
          onFirstPing();
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

  void onFirstPing() {
    ioBConnected = true;
    ioBrokerManager.connected = true;
    ioBrokerManager.connectionStatusStreamController.add(true);
    tries = 0;
    deviceManager.subscribeToDataPointsIoB(this);
  }

  void sendMsg(DataPackage dataPackage) {
    if(!ioBConnected) {
      return;
    }
    _webSocket?.sink.add(jsonEncode({"type": dataPackage.type.name, "content": dataPackage.content}));
  }
}
