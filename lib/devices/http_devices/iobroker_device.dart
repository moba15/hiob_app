import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/devices/device.dart';

class IoBrokerDevice extends Device {


  String objectID;

  IoBrokerDevice(
      {required int iconID, required String name, required this.objectID})
      : super(iconID, name);

  IoBrokerDevice.withID(
      {required int iconID, required String name, required this.objectID, required String id})
      : super.withID(iconID, name, id);


  factory IoBrokerDevice.fromJSON(Map<String, dynamic> json) =>
      IoBrokerDevice.withID(
        id: json["id"],
        iconID: json["iconID"],
        name: json["name"],
        objectID: json["objectID"],
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