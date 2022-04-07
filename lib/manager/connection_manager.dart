import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
class ConnectionManager {
  bool ioBConnected = false;
  Socket? socket;
  WebSocketChannel? _webSocket;
  StreamSubscription? _webSocketStreamSub;
  final StreamController statusStreamController = StreamController();
  final DeviceManager deviceManager;
  final IoBrokerManager ioBrokerManager;

  ConnectionManager(
      {required this.deviceManager, required this.ioBrokerManager});

  Future<void> connectIoB() async {
    
    
    try {
      print("Connecting to " + ioBrokerManager.ip + ":" +
          ioBrokerManager.port.toString());
      _webSocket =  IOWebSocketChannel.connect(Uri.parse("ws://" + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString()), pingInterval: const Duration(minutes: 5));
      _webSocketStreamSub = _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);
      ioBrokerManager.connectionStatusStreamController.add(true);
      ioBrokerManager.connected = true;
      ioBConnected = true;

      print("Connected to " + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString());

    } catch(e) {
      ioBrokerManager.connectionStatusStreamController.addError("Connection failed");
    } finally {
      statusStreamController.add(true);
      statusStreamController.close();
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
    
    print("Connecting to " + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString());
    try {
      _webSocket =  IOWebSocketChannel.connect(Uri.parse("ws://" + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString()));
      _webSocketStreamSub = _webSocket!.stream.listen(onData, onError: onError, onDone: onDone);

      ioBConnected = true;
      ioBrokerManager.connected = true;
      ioBrokerManager.connectionStatusStreamController.add(true);
      print("Connected to " + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString());
    } catch(e) {
      ioBrokerManager.connected = false;
      ioBrokerManager.connectionStatusStreamController.add(false);
      _webSocket = null;
      _webSocketStreamSub = null;
    }

  }

  void onData(event) {
    print("Data received: " + event + DateFormat(" hh:mm:ss").format(DateTime.now()));
    readPackage(event);
  }

  void close()  async {
    await _webSocketStreamSub?.cancel();
    await _webSocket?.sink.close();

    ioBConnected = false;
  }

  void onDone() async {
    print("Connection closed");
    ioBrokerManager.connected = false;
    ioBrokerManager.connectionStatusStreamController.add(false);
    ioBConnected = false;

  }

  void readPackage(String msg) {
    try {
      Map<String, dynamic> rawMap = jsonDecode(msg);
      DataPackageType packageType = DataPackageType.values
          .firstWhere((element) => element.name == rawMap["type"]);
      print("Recieved MSG:" + packageType.name);
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
      }
    } catch(e) {
      print(e);

    }
  }

  void stateChangedPackage({required String objectID, required dynamic value}) {
    DataPoint? iobDataPoint =
        deviceManager.getIoBrokerDataPointByObjectID(objectID);
    deviceManager.valueChange(iobDataPoint, value);
  }

  void onFirstPing() {
    deviceManager.subscribeToDataPointsIoB(this);
  }

  void sendMsg(DataPackage dataPackage) {
    if(!ioBConnected) {
      return;
    }
    _webSocket?.sink.add(jsonEncode({"type": dataPackage.type.name, "content": dataPackage.content}));
  }
}
