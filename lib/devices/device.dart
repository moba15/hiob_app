import 'dart:math';

import 'package:flutter/material.dart';

import 'cubit/device_cubit.dart';
var r = Random();



String generateRandomString(int len) {

  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

abstract class Device<T> extends DeviceCubit<T> {
  int iconID;
  String id;
  String name;
  Device({required this.id, required this.name, required this.iconID, required T? value, required DeviceStatus status}) : super(value, status);

  Future<void> startTimer() async {
    int s = 0;
    while(true) {
      await Future.delayed(Duration(seconds: 1));
      s++;
      changeLastUpdated(Duration(seconds: s));
      if(s%2==0) {
        changeStatus(DeviceStatus.READY);
      } else  {
        changeStatus(DeviceStatus.UNAVALIBLE);
      }
    }
  }

  Map<String, dynamic> toJson();
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