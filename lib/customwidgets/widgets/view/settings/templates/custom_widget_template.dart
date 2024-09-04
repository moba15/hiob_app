import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';

class CustomWidgetTemplate extends CustomWidgetWrapper {
  @override
  String id;
  CustomWidgetDeprecated customWidget;
  @override
  String name;

  CustomWidgetTemplate(
      {required this.id, required this.name, required this.customWidget});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "widget": customWidget.toJson(),
      };

  @override
  CustomWidgetTypeDeprecated? get type {
    return customWidget.type;
  }

  @override
  Widget get widget {
    return customWidget.widget;
  }

  @override
  // TODO: implement settingWidget
  CustomWidgetSettingWidget get settingWidget => customWidget.settingWidget;
}
