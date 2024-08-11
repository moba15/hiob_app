import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
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
  final CustomWidgetTypeDeprecated type;
  String id;
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
