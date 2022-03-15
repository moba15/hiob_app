import 'package:flutter/material.dart';

class CustomWidget {

  static String typeID = "-1";
  String name;
  String type;
  late Widget widget;
  Map<String, dynamic> settings;

  CustomWidget(
      {required this.name, required this.type, required this.settings});

  factory CustomWidget.fromJSON(Map<String, dynamic> json) => CustomWidget(
      name: json["name"], type: json["type"], settings: json["settings"]);

  Map<String, dynamic> toJson() => {
        "type": type,
        "settings": settings,
        "name": name,
      };
}
