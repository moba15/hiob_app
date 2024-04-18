import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

import 'device.dart';

class IoBrokerDevice extends Device {
  IoBrokerDevice(
      {required String id,
      required String name,
      required IconWrapper iconWrapper,
      required DateTime lastUpdated,
      required this.objectID,
      List<DataPoint>? dataPoints = const []})
      : super(
            id: id,
            name: name,
            iconWrapper: iconWrapper,
            lastUpdated: lastUpdated,
            type: DeviceType.ioBroker,
            dataPoints: dataPoints);
  String objectID;

  factory IoBrokerDevice.fromJSON(Map<String, dynamic> json) {
    IconWrapper iconWrapper = const IconWrapper(
        iconDataType: IconDataType.flutterIcons, iconData: Icons.home);
    //!Support for older versions
    if (json["iconID"] != null) {
      iconWrapper = IconWrapper(
          iconDataType: IconDataType.flutterIcons,
          iconData: IconData(int.parse(json["iconID"], radix: 16),
              fontFamily: "MaterialIcons"));
    } else if (json["iconWrapper"] != null) {
      iconWrapper = IconWrapper.fromJSON(json["iconWrapper"]);
    }
    IoBrokerDevice d = IoBrokerDevice(
      id: json["id"],
      iconWrapper: iconWrapper,
      name: json["name"],
      objectID: json["objectID"],
      dataPoints: [],
      lastUpdated: DateTime.now(),
    );
    //!Support for older versions
    List<dynamic>? dataPointsRaw = json["dataPoints"] is String
        ? jsonDecode(json["dataPoints"])
        : json["dataPoints"];
    List<DataPoint>? dataPoints = [];
    if (dataPointsRaw != null) {
      for (Map<String, dynamic> dataPointRaw in dataPointsRaw) {
        dataPoints.add(DataPoint.fromJSON(dataPointRaw, d));
      }
    }
    d.dataPoints = dataPoints;
    return d;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconWrapper": iconWrapper,
        "objectID": objectID,
        "type": type.index,
        "dataPoints": dataPoints?.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return "Device: ${toJson()}";
  }
}
