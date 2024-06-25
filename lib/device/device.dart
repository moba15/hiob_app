import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/device/state/datapointTypes/datapoint_role.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

class Device {
  String id;
  String name;
  IconWrapper iconWrapper;
  dynamic value;
  DateTime lastUpdated;
  bool _firstUpdateFromServer = false;
  DeviceType type;
  List<DataPoint>? dataPoints;
  bool overrideDeviceStatus;

  Device(
      {required this.id,
      required this.name,
      required this.iconWrapper,
      this.value,
      required this.lastUpdated,
      required this.type,
      required this.overrideDeviceStatus,
      this.dataPoints = const []});

  StreamController<dynamic> valueStreamController =
      StreamController.broadcast();
  StreamController<DateTime> lastUpdatedStreamController =
      StreamController.broadcast();
  StreamController<DeviceStatus> statusStreamController =
      StreamController.broadcast();

  set setValue(dynamic value) {
    this.value = value;
    valueStreamController.add(value);
  }

  set setFirstUpdate(bool firstUpdateFromServer) {
    if (_firstUpdateFromServer) {
      return;
    }
    _firstUpdateFromServer = firstUpdateFromServer;
    statusStreamController.add(getDeviceStatus());
  }

  set setLastUpdated(DateTime lastUpdated) {
    this.lastUpdated = lastUpdated;
    lastUpdatedStreamController.add(lastUpdated);
  }

  void idle() {
    lastUpdatedStreamController.add(DateTime.fromMillisecondsSinceEpoch(
        lastUpdated.millisecondsSinceEpoch));
  }

  void addDataPoint(DataPoint dataPoint) {
    dataPoints?.add(dataPoint);
  }

  void removeDataPoint(DataPoint dataPoint) {
    dataPoints?.remove(dataPoint);
  }

  void removeDataPointById(String id) {
    dataPoints?.removeWhere((element) => element.id == id);
  }

  DeviceStatus getDeviceStatus() {
    if (overrideDeviceStatus) {
      return DeviceStatus.ready;
    }
    if (!_firstUpdateFromServer) {
      return DeviceStatus.error;
    }
    for (DataPoint dataPoint in dataPoints ?? []) {
      if (dataPoint.role == IoBrokerStateRoles.indicatorReachable) {
        if (dataPoint.value == true) {
          return DeviceStatus.ready;
        } else {
          return DeviceStatus.unavailable;
        }
      }
    }
    if (!_firstUpdateFromServer) {
      return DeviceStatus.error;
    }
    return DeviceStatus.ready;
  }

  int? getBatteryLevel() {
    for (DataPoint dataPoint in dataPoints ?? []) {
      if (dataPoint.role == IoBrokerStateRoles.valueBattery) {
        if (dataPoint.value is int) {
          return dataPoint.value;
        } else if (dataPoint.value is double) {
          return dataPoint.value.round();
        } else {
          return null;
        }
      }
    }
    return null;
  }

  DataPoint? getDataPoint({required String id}) {
    for (DataPoint dataPoint in dataPoints ?? []) {
      if (dataPoint.id == id) {
        return dataPoint;
      }
    }
    return null;
  }
}

enum DeviceType { httpDevice, ioBroker }

extension DeviceExtension on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.ioBroker:
        return 'IoBroker';
      case DeviceType.httpDevice:
        return 'Http';
      default:
        return "Unknown, you fucked up";
    }
  }

  Widget setupWidget(TextEditingController controller) {
    switch (this) {
      case DeviceType.ioBroker:
        {
          return Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              onChanged: (value) {},
              controller: controller,
              decoration: const InputDecoration(hintText: "ID of device"),
            ),
          );
        }
      case DeviceType.httpDevice:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              child: const SizedBox(
                width: 50,
                child: Text("Adr.:"),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) {},
                controller: controller,
                decoration: const InputDecoration(hintText: "Address"),
              ),
            )
          ],
        );
      default:
        return const Text("LOL");
    }
  }
}
