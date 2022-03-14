import 'package:flutter/material.dart';

class CustomWidget {

  static String typeID = "-1";

  String type;
  late Widget widget;
  Map<String, dynamic> settings;

  CustomWidget({required this.type, required this.settings});

  factory CustomWidget.fromJSON(Map<String, dynamic> json) =>
      CustomWidget(type: json["type"], settings: json["settings"]);

  Map<String, dynamic> toJson() => {
        "type": type,
        "settings": settings,
      };
}
