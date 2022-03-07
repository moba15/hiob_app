import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:smart_home/devices/cubit/device_cubit.dart';
import 'package:smart_home/devices/http_devices/iobroker_device.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/screens/settings/device/cubit/device_list_cubit.dart';

import '../devices/device.dart';

class DeviceManager {

  FileManager fileManager;
  List<Device> devicesList;
  bool loaded = false;
  DeviceManager(this.fileManager, {required this.devicesList});


  Future<List<Device>> loadDevices() async {
    await Future.delayed(const Duration(seconds: 5));
    devicesList.add(IoBrokerDevice(
        name: "Name",
        objectID: "Id",
        status: DeviceStatus.READY,
        iconID: 20,
        value: 100,
        id: "id"

    )..startTimer());

    return devicesList;

  }



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
