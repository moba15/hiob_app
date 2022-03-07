import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';

class Device {
  String id;
  String name;
  String iconID;
  dynamic value;
  DateTime lastUpdated;
  DeviceStatus status;
  DeviceType type;

  Device(
      {required this.id,
      required this.name,
      required this.iconID,
      this.value,
      required this.lastUpdated,
      required this.type,
      this.status = DeviceStatus.unavailable});

  StreamController<dynamic> valueStreamController =
      StreamController.broadcast();
  StreamController<DateTime> lastUpdatedStreamController =
      StreamController.broadcast();
  StreamController<DeviceStatus> statusStreamController = StreamController.broadcast();

  set setValue(dynamic value) {
    this.value = value;
    valueStreamController.add(value);
  }


  set setStatus(DeviceStatus status) {
    this.status = status;
    statusStreamController.add(status);
  }

  set setLastUpdated(DateTime lastUpdated) {
    this.lastUpdated = lastUpdated;
    lastUpdatedStreamController.add(lastUpdated);
  }


  void idle() {
    lastUpdatedStreamController.add(DateTime.fromMillisecondsSinceEpoch(lastUpdated.millisecondsSinceEpoch));
  }

}
enum DeviceType {
  httpDevice,
  ioBroker

}
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
      case DeviceType.ioBroker: {



        return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const SizedBox(
                width: 50,
                child: Text("ID:"),
              ),
              margin: const EdgeInsets.only(right: 20.0),
            ),
            Expanded(

              child: TextField(
                onChanged: (value) {

                },
                controller: controller,
                decoration: const InputDecoration(hintText: "ID of device"),
              ),
            )
          ],
        );
      }

      case DeviceType.httpDevice:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const SizedBox(
                width: 50,
                child: Text("Adr.:"),
              ),
              margin: const EdgeInsets.only(right: 20.0),
            ),
            Expanded(

              child: TextField(
                onChanged: (value) {

                },
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