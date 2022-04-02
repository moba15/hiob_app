import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_text_widget.dart';

enum CustomWidgetType {
  text,
  simpleSwitch,
}

extension CustomWidgetTypeExtension on CustomWidgetType {
  Widget getSettingWidget() {
    switch (this) {
      case CustomWidgetType.text:
        return CustomTextWidget.edit().settingWidget;
      case CustomWidgetType.simpleSwitch:
        return CustomSimpleSwitchWidget.edit().settingWidget;
      default:
        return const Text("Error 12");
    }
  }

  String get name {
    switch (this) {
      case CustomWidgetType.text:
        return "Simple Text Widget";
      case CustomWidgetType.simpleSwitch:
        return "Simple Switch Widget";
      default:
        return "Error";
    }
  }
}

class CustomWidget {
  static String typeID = "-1";
  String? name;
  CustomWidgetType? type;
  Map<String, dynamic>? settings;

  CustomWidget(
      {required this.name, required this.type, required this.settings});

  CustomWidget.edit();

  Widget get widget {
    throw UnimplementedError();
  }

  factory CustomWidget.fromJSON(Map<String, dynamic> json) => CustomWidget(
      name: json["name"], type: json["type"], settings: json["settings"]);

  Map<String, dynamic> toJson() => {
        "type": type,
        "settings": settings,
        "name": name,
      };
}
