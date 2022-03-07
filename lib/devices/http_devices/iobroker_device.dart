import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/devices/device.dart';

import '../cubit/device_cubit.dart';

class IoBrokerDevice<T> extends Device<T> {


  String objectID;
  IoBrokerDevice({required String id, required String name, required T? value, required DeviceStatus status,  required this.objectID, required int iconID}) :
        super(id: id, name: name, status: status, value: value, iconID: iconID);




  factory IoBrokerDevice.fromJSON(Map<String, dynamic> json) =>
      IoBrokerDevice(
        id: json["id"],
        iconID: json["iconID"],
        name: json["name"],
        objectID: json["objectID"],
        status: DeviceStatus.UNAVALIBLE, value: null
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "iconID": iconID,
        "objectID": objectID,
      };


  @override
  String toString() {
    return "Device: " + toJson().toString();
  }
}