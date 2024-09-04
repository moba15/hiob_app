import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart' as old;

abstract class CustomWidgetWrapper {
  old.CustomWidgetTypeDeprecated? get type;
  String get name;
  set name(String n);
  String get id;
  Widget get widget;
  old.CustomWidgetSettingWidget get settingWidget;
}
