import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';

class ConnectionManager {
  bool ioBConnected = false;
  Socket? socket;
  final StreamController statusStreamController = StreamController();
  final DeviceManager deviceManager;
  final IoBrokerManager ioBrokerManager;

  ConnectionManager(
      {required this.deviceManager, required this.ioBrokerManager});

  Future<void> connectIoB() async {
    try {
      print("Connecting to " + ioBrokerManager.ip + ":" +
          ioBrokerManager.port.toString());
      socket = await Socket.connect(ioBrokerManager.ip, ioBrokerManager.port);
      print("Connected");
      socket?.handleError(onError);
      socket?.listen(onData, onDone: onDone);

      ioBConnected = true;


      ioBrokerManager.connected = true;
      ioBrokerManager.connectionStatusStreamController.add(true);
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
    ioBrokerManager.statusStreamController.add(false);
    print("Error: " + e);

  }

  void reconnect() async {

    await socket?.close();
    socket?.destroy();
    ioBConnected = false;
    ioBrokerManager.connected = false;


    print("Connecting to " + ioBrokerManager.ip + ":" + ioBrokerManager.port.toString());
    try {
      socket = await Socket.connect(ioBrokerManager.ip, ioBrokerManager.port);
      socket?.handleError(onError);
      socket?.listen(onData, onDone: onDone);

      ioBConnected = true;

      ioBrokerManager.connected = true;
      ioBrokerManager.connectionStatusStreamController.add(true);
    } catch(e) {
      ioBrokerManager.connected = true;
      ioBrokerManager.connectionStatusStreamController.add(false);
    }

  }

  void onData(event) {
    String msg = utf8.decode(event);
    print("Data received: " + msg.toString());
    readPackage(msg);
  }

  void close()  async {
    socket?.destroy();
    ioBConnected = false;
  }

  void onDone() async {
    print("Connection closed");
    ioBrokerManager.connected = true;
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
      }
    } catch(e) {

    }
  }

  void stateChangedPackage({required String objectID, required dynamic value}) {
    print("t"); //TODO:
    DataPoint? iobDataPoint =
        deviceManager.getIoBrokerDataPointByObjectID(objectID);
    deviceManager.valueChange(iobDataPoint, value);
  }

  void sendMsg(DataPackage dataPackage) {
    print("Sending Msg: " + dataPackage.type.name);
    socket?.write(jsonEncode(
        {"type": dataPackage.type.name, "content": dataPackage.content}));
  }
}
