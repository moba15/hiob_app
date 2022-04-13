import 'dart:async';
import 'dart:convert';

import 'package:smart_home/device/datapoint/datapointTypes/datapoint_role.dart';
import 'package:smart_home/device/datapoint/datapointTypes/datapoint_types.dart';
import 'package:smart_home/device/iobroker_device.dart';

import '../device.dart';

class DataPoint {
  dynamic value;
  String name;
  String id;
  Device? device;
  DataPointType? type;
  DataPointRoles? role;
  Map<String, dynamic>? information;

  StreamController valueStreamController = StreamController.broadcast();

  DataPoint({required this.name, required this.device, required this.id});


  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "type": type,
        "role": role,
        "information": jsonEncode(information),
      };
  set setValue(dynamic value) {
    this.value = value;
    valueStreamController.add(value);
  }
  get isIoBrokerDataPoint => device is IoBrokerDevice;
}
