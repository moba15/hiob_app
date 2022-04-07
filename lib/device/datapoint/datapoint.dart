import 'dart:async';

import '../device.dart';

class DataPoint {
  dynamic value;
  String name;
  String id;
  Device? device;

  StreamController valueStreamController = StreamController.broadcast();

  DataPoint({required this.name, required this.device, required this.id});


  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
      };

  set setValue(dynamic value) {
    this.value = value;
    valueStreamController.add(value);
  }


}
