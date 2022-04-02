import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_home/device/device.dart';
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
    socket = await Socket.connect("192.168.178.68", 8081);
    print("Connected");
    ioBConnected = true;
    statusStreamController.add(true);
    statusStreamController.close();
    socket?.handleError(onError);
    socket?.listen(onData);
    done();
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

  void done() async {
    await socket?.done;
    print("Connection closed");
    ioBConnected = false;
  }

  void readPackage(String msg) {
    Map<String, dynamic> rawMap = jsonDecode(msg);
    String packageType = rawMap["type"];
    switch (packageType) {
      case "StateChanged": //TODO: ENUM
        stateChangedPackage(
            objectID: rawMap["objectID"], value: rawMap["value"]);
        break;
    }
  }

  void stateChangedPackage({required String objectID, required dynamic value}) {
    IoBrokerDevice? ioBrokerDevice =
        deviceManager.getIoBrokerDeviceByObjectID(objectID);
    deviceManager.valueChange(ioBrokerDevice, value);
    print("Change");
  }

  void sendIoBChangeValue(Device device, dynamic v) {
    if (device is! IoBrokerDevice) {
      return;
    }
    socket?.write(jsonEncode({
      "type": "StateChangeRequest",
      "objectID": (device).objectID,
      "value": v,
    }));
  }
}
