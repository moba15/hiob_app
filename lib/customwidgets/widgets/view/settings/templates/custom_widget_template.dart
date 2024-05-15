import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart'
    as n;

class CustomWidgetTemplate extends CustomWidgetWrapper {
  String id;
  CustomWidget customWidget;
  String name;

  CustomWidgetTemplate(
      {required this.id, required this.name, required this.customWidget});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "widget": customWidget.toJson(),
      };

  @override
  n.CustomWidgetType? get type {
    print("Type:  " + customWidget.type!.name.toString());
    return n.CustomWidgetType.values
        .firstWhere((element) => element.name == customWidget.type?.name);
  }

  @override
  Widget get widget {
    return customWidget.widget;
  }

  @override
  // TODO: implement settingWidget
  CustomWidgetSettingWidget get settingWidget => customWidget.settingWidget;
}
