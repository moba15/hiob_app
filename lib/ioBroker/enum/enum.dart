import 'dart:convert';

import 'package:smart_home/device/datapoint/datapoint.dart';
class Enum {
  String name;
  String id;
  String? icon;
  List<String> members;
  List<DataPoint> dataPointMembers;


  Enum({required this.name, required this.id, required this.icon, required this.members, required this.dataPointMembers});

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "icon": icon,
        "members": jsonEncode(members),
        "dataPointMembers": jsonEncode(dataPointMembers),
      };
  factory Enum.fromJSON(Map<String, dynamic> json) {
    List<DataPoint> dataPointMembers = [];
    if(json["dataPointMembers"] is String) {
      for (Map<String, dynamic> dataPointRaw in jsonDecode(json["dataPointMembers"] ?? "[]") ?? []) {
        dataPointMembers.add(DataPoint.fromJSON(dataPointRaw, null));
      }
    } else {
      for (Map<String, dynamic> dataPointRaw in json["dataPointMembers"] ?? []) {
        dataPointMembers.add(DataPoint.fromJSON(dataPointRaw, null));
      }
    }
    Enum e = Enum(name: json["name"], id: json["id"], icon: json["icon"], members: (jsonDecode(json["members"] ?? "[]") as List<dynamic>).map((e) =>
        e.toString()).toList(), dataPointMembers: dataPointMembers );
    return e;
  }


}