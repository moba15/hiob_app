import 'dart:async';
import 'dart:convert';

import 'package:smart_home/device/datapoint/datapointTypes/datapoint_types.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/manager/history/history_data.dart';

import '../device.dart';

class DataPointValueChangeEvent {
  final dynamic value;
  final int ts;
  final int lc;
  DataPointValueChangeEvent(
      {required this.value, required this.lc, required this.ts});
}

class DataPoint {
  dynamic value;
  dynamic olderValue;
  int ts = 0, lc = 0;
  String name;
  String id;
  Device? device;
  DataPointType? type;
  String? role;
  String? valueType;

  Map<String, dynamic>? otherDetails;

  HistoryData historyData = HistoryData();

  StreamController<DataPointValueChangeEvent> valueStreamController =
      StreamController.broadcast();

  DataPoint({
    required this.name,
    required this.device,
    required this.id,
    this.role,
    this.type,
    this.otherDetails,
  });

  factory DataPoint.fromJSON(Map<String, dynamic> json, Device? device) {
    return DataPoint(
        name: json["name"].toString(),
        device: device,
        id: json["id"],
        role: json["role"],
        type: json["valueType"],
        otherDetails: json);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "role": role,
      "valueType": valueType,
      "otherDetails": jsonEncode(otherDetails),
    };
  }

  void setValue({required dynamic value, required int ts, required int lc}) {
    if (value != this.value) {
      if (this.value != null) {
        olderValue = this.value;
      } else {
        olderValue = value;
      }
      this.value = value;
      valueStreamController
          .add(DataPointValueChangeEvent(value: value, lc: lc, ts: ts));
    }
  }

  get isIoBrokerDataPoint => device is IoBrokerDevice;

  dynamic getInformation(String key) {
    return otherDetails?[key];
  }

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        other is DataPoint && other.type == type && other.id == id;
  }
}
