import 'dart:async';

import 'package:smart_home/device/state/datapointTypes/datapoint_types.dart';
import 'package:smart_home/device/iobroker_device.dart';

import '../device.dart';

class DataPoint {
  dynamic value;
  String name;
  String id;
  Device? device;
  StateType? type;
  String? role;
  String? valueType;

  Map<String, dynamic>? otherDetails;

  DataPoint({
    required this.name,
    required this.id,
    this.device,
    this.role,
    this.type,
    this.otherDetails,
  });

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
