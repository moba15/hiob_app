import 'dart:convert';

import 'package:smart_home/device/datapoint/datapoint.dart';

import 'device.dart';

class IoBrokerDevice extends Device {
  IoBrokerDevice(
      {required String id,
      required String name,
      required String iconID,
      required DateTime lastUpdated,
      required this.objectID,
      List<DataPoint>? dataPoints = const []})
      : super(
            id: id,
            name: name,
            iconID: iconID,
            lastUpdated: lastUpdated,
            type: DeviceType.ioBroker,
            dataPoints: dataPoints);
  String objectID;

  factory IoBrokerDevice.fromJSON(Map<String, dynamic> json) {
    IoBrokerDevice d = IoBrokerDevice(
      id: json["id"],
      iconID: json["iconID"],
      name: json["name"],
      objectID: json["objectID"],
      dataPoints: [],
      lastUpdated: DateTime.now(),
    );
    List<dynamic>? dataPointsRaw = jsonDecode(json["dataPoints"]);
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
        "iconID": iconID,
        "objectID": objectID,
        "type": type.index,
        "dataPoints": jsonEncode(dataPoints),
      };

  @override
  String toString() {
    return "Device: " + toJson().toString();
  }
}
