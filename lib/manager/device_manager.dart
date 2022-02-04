import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:smart_home/manager/file_manager.dart';

import '../devices/device.dart';

class DeviceManager {

  FileManager fileManager;
  List<Device> devicesList;
  DeviceManager(this.fileManager, {this.devicesList = const []});



  bool addDevice(Device device) {
    if (kDebugMode) {
      print(jsonEncode(device));
    }
    return true;
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