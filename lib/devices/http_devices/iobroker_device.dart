import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/devices/device.dart';

class IoBrokerDevice extends Device {


  String objectID;

  IoBrokerDevice(
      {required String id, required int iconID, required String name, required this.objectID})
      : super(id, iconID, name);


  factory IoBrokerDevice.fromMap(Map<String, dynamic> json) =>
      IoBrokerDevice(
        id: json["id"],
        iconID: json["iconID"],
        name: json["name"],
        objectID: json["objectID"],
      );

  Map<String, dynamic> toMap() =>
      {
        "id": id,
        "name": name,
        "iconID": iconID,
        "objectID": objectID,
      };


  @override
  String toString() {
    return "Device: " + toMap().toString();
  }
}