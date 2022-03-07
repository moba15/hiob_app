import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:smart_home/device/iobroker_device.dart';

import 'package:smart_home/manager/file_manager.dart';

import '../device/device.dart';


class DeviceManager {

  FileManager fileManager;
  List<Device> devicesList;
  StreamController deviceListStreamController = StreamController.broadcast();
  bool loaded = false;
  final String key = "devices";

  DeviceManager(this.fileManager, {required this.devicesList});


  Future<List<Device>> loadDevices() async {
    if(loaded) {
      return devicesList;
    }

    List<dynamic>? l = await fileManager.getList(key);
    if(l== null) {
      devicesList = [];
    } else  {
      for(dynamic rawDevice in l) {

        Map<String, dynamic> rawMap = rawDevice;
        int? typeInt = rawMap["type"];
        if(typeInt == null) {
          throw Exception("Dumm?");
        }

        DeviceType type = DeviceType.values[typeInt];
        print(typeInt);
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
    while(true) {
      await Future.delayed(const Duration(seconds: 2));
      for(Device d in devicesList) {
        d.idle();
      }
    }
  }




  Future<bool> addDevice(Device device) async {
    devicesList.add(device);

    bool suc = await fileManager.writeJSONList(key, devicesList);
    if(!suc) {
      devicesList.remove(device);
    }
    deviceListStreamController.add(devicesList);

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


  bool existsDevice(String id) {
    return devicesList.indexWhere((element) => element.id == id) != -1 ;
  }

  Device? getDevice(String id) {
    for(Device d in devicesList) {
      if(d.id == id) {
        return d;
      }
    }
    return null;
  }











}
