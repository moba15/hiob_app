import 'package:flutter/material.dart';


abstract class Device {
  String id;
  int iconID;
  String name;


  Device(this.id, this.iconID, this.name);

  Map<String, dynamic> toMap();




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