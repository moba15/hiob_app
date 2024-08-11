import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/device/state/state.dart';

enum CustomWidgetType {
  simpleSwitch,
  simpleValue,
  advanced,
  light,
  group,
  line,
  webView,
  alertDialog,
  table,
  graph,
  colorPallete,
  mediaPlayer,
}

extension CustomWidgetTypeExtension on CustomWidgetType {
  String get name {
    switch (this) {
      case CustomWidgetType.simpleSwitch:
        return "Button";
      case CustomWidgetType.light:
        return "Switch with Slider";
      case CustomWidgetType.line:
        return "Division Line";
      case CustomWidgetType.simpleValue:
        return "Value";
      case CustomWidgetType.advanced:
        return "Advanced/Flexible";
      case CustomWidgetType.webView:
        return "Web View";
      case CustomWidgetType.table:
        return "Table";
      case CustomWidgetType.graph:
        return "Graph (only sql Adapter)";
      case CustomWidgetType.colorPallete:
        return "Color Palette";
      case CustomWidgetType.mediaPlayer:
        return "Network Media Player";
      default:
        return toString();
    }
  }
}

abstract class CustomWidget extends CustomWidgetWrapper {
  @override
  final CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  final String name;

  CustomWidget({
    required this.type,
    required this.id,
    required this.name,
  });

  CustomWidgetSettingWidget get settingWidget;
  Widget get widget;
  List<DataPoint> get dependentDataPoints;
}
