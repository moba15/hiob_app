import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/device_manager.dart';

class ConnectionManager {
  bool ioBConnected = false;
  Socket? socket;
  String ip;
  int port;
  final StreamController statusStreamController = StreamController();
  final DeviceManager deviceManager;

  ConnectionManager(
      {required this.ip, required this.port, required this.deviceManager});

  Future<void> connectIoB() async {
    print("Connecting to " + ip + ":" + port.toString());
    socket = await Socket.connect(ip, port);
    print("Connected");
    ioBConnected = true;
    statusStreamController.add(true);
    statusStreamController.close();
    socket?.handleError(onError);
    socket?.listen(onData, onDone: onDone);
  }

  void onError(e) {
    deviceManager.manager.managerStatusStreamController
        .add(ManagerStatus.error);
    print("Error: " + e);
    ioBConnected = false;
  }

  void onData(event) {
    String msg = utf8.decode(event);
    print("Data received: " + msg.toString());
    readPackage(msg);
  }

  void close() {
    socket?.destroy();
    ioBConnected = false;
  }

  void onDone() async {
    print("Connection closed");
    ioBConnected = false;
    while (!ioBConnected) {
      await connectIoB();
    }
  }

  void readPackage(String msg) {
    Map<String, dynamic> rawMap = jsonDecode(msg);
    DataPackageType packageType = DataPackageType.values
        .firstWhere((element) => element.name == rawMap["type"]);
    print("Recieved MSG:" + packageType.name);
    switch (packageType) {
      case DataPackageType.iobStateChanged:
        stateChangedPackage(
            objectID: rawMap["objectID"], value: rawMap["value"]);
        break;
    }
  }

  void stateChangedPackage({required String objectID, required dynamic value}) {
    IoBrokerDevice? ioBrokerDevice =
        deviceManager.getIoBrokerDeviceByObjectID(objectID);
    deviceManager.valueChange(ioBrokerDevice, value);
  }

  void sendMsg(DataPackage dataPackage) {
    print("Sending Msg: " + dataPackage.type.name);
    socket?.write(jsonEncode(
        {"type": dataPackage.type.name, "content": dataPackage.content}));
  }
}
