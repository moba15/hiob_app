import 'dart:async';

import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/manager/connection_manager.dart';
import 'package:smart_home/manager/file_manager.dart';

import '../device/device.dart';
import 'manager.dart';

class DeviceManager {

  FileManager fileManager;
  Manager manager;
  List<Device> devicesList;
  StreamController deviceListStreamController = StreamController.broadcast();
  bool loaded = false;
  final String key = "devices";

  List<DataPoint> possibleDataPoints = [];

  DeviceManager(this.fileManager,
      {required this.devicesList, required this.manager});

  Future<List<Device>> loadDevices() async {
    if (loaded) {
      deviceListStreamController.add(devicesList);
      return devicesList;
    }

    List<dynamic>? l = await fileManager.getList(key);
    if(l== null) {
      loaded = true;
      devicesList = [];
    } else  {
      for(dynamic rawDevice in l) {

        Map<String, dynamic> rawMap = rawDevice;
        int? typeInt = rawMap["type"];
        if(typeInt == null) {
          throw Exception("Dumm?");
        }

        DeviceType type = DeviceType.values[typeInt];
        switch (type) {
          case DeviceType.ioBroker:
            devicesList.add(IoBrokerDevice.fromJSON(rawMap));
            break;
        }
      }
    }
    loaded = true;
    deviceListStreamController.add(devicesList);
    return devicesList;

  }

  void startIdle() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      for (Device d in devicesList) {
        d.idle();
      }
    }
  }

  void loadPossibleDataPoints(Map<String, dynamic> data) {}

  Future<bool> addDevice(Device device) async {
    devicesList.add(device);
    bool suc = await fileManager.writeJSONList(key, devicesList);
    if (!suc) {
      devicesList.remove(device);
    }
    deviceListStreamController.add(devicesList);
    if(device.dataPoints != null && device.dataPoints!.isNotEmpty) {
      manager.connectionManager.sendMsg(SubscribeToDataPointsIobPackage(dataPoints: device.dataPoints!.map((e) => e.id).toList()));
    }
    return suc;
  }

  Future<bool> editDevice(Device device) async {
    bool suc = await fileManager.writeJSONList(key, devicesList);
    deviceListStreamController.add(devicesList);
    if(device.dataPoints != null && device.dataPoints!.isNotEmpty) {
      manager.connectionManager.sendMsg(SubscribeToDataPointsIobPackage(dataPoints: device.dataPoints!.map((e) => e.id).toList()));
    }
    return suc;

  }

  Future<bool> removeDevice(Device device) async{
    devicesList.remove(device);
    bool suc = await fileManager.writeJSONList(key, devicesList);
    if(!suc) {
      devicesList.add(device);
    }
    deviceListStreamController.add(devicesList);
    return suc;
  }

  Future<bool> update() async{
    bool suc = await fileManager.writeJSONList(key, devicesList);
    deviceListStreamController.add(devicesList);
    return suc;
  }

  Future<bool> addDataPointToDevice(Device device, DataPoint dataPoint) async {
    device.addDataPoint(dataPoint);
    bool suc = await fileManager.writeJSONList(key, devicesList);
    if(!suc) {
      device.removeDataPoint(dataPoint);
    }
    deviceListStreamController.add(devicesList);
    if(device.dataPoints != null && device.dataPoints!.isNotEmpty) {
      manager.connectionManager.sendMsg(SubscribeToDataPointsIobPackage(dataPoints: device.dataPoints!.map((e) => e.id).toList()));
    }
    return suc;
  }


  bool existsDevice(String id) {
    return devicesList.indexWhere((element) => element.id == id) != -1 ;
  }

  Device? getDevice(String id) {
    for (Device d in devicesList) {
      if (d.id == id) {
        return d;
      }
    }
    return null;
  }

  IoBrokerDevice? getIoBrokerDeviceByObjectID(String objectID) {
    for (Device d in devicesList) {
      if (d is IoBrokerDevice) {
        IoBrokerDevice ioBd = d;
        if (ioBd.objectID == objectID) {
          return ioBd;
        }
      }
    }
    return null;
  }

  DataPoint? getIoBrokerDataPointByObjectID(String objectID) {
    for (Device d in devicesList) {
      for (DataPoint dataPoint in d.dataPoints ?? []) {

        if(dataPoint.id == objectID) {
          return dataPoint;
        }

      }

    }
    return null;
  }

  void valueChange(DataPoint? dataPoint, dynamic value) {
    if (dataPoint == null) {
      return;
    }
    dataPoint.value = value;
    dataPoint.valueStreamController.add(value);
  }


  void subscribeToDataPointsIoB(ConnectionManager connectionManager) {
    List<String> dataPoints = [];
    for(Device device in devicesList) {
      if(device is IoBrokerDevice) {
        for(DataPoint dataPoint in device.dataPoints ?? []) {
          dataPoints.add(dataPoint.id);
        }
      }
    }
    connectionManager.sendMsg(SubscribeToDataPointsIobPackage(dataPoints: dataPoints));
  }


}
