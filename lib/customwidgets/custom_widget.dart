import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_color_pallete_widget.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';

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
}

extension CustomWidgetTypeExtension on CustomWidgetType {
  CustomWidgetSettingWidget get settingWidget {
    switch (this) {
      case CustomWidgetType.simpleSwitch:
        return CustomSimpleSwitchWidget.edit().settingWidget;
      case CustomWidgetType.light:
        return CustomLightWidget(name: "").settingWidget;
      case CustomWidgetType.group:
        throw UnimplementedError("Error 12");
      case CustomWidgetType.line:
        return CustomDivisionLineWidget(name: "").settingWidget;
      case CustomWidgetType.simpleValue:
        return CustomSimpleValueWidget.edit().settingWidget;
      case CustomWidgetType.advanced:
        return AdvancedCustomWidget.edit().settingWidget;
      case CustomWidgetType.webView:
        return CustomWebViewWidget(name: null, url: null, dataPoint: null)
            .settingWidget;
      case CustomWidgetType.alertDialog:
        return CustomAlertDialogWidget(name: "").settingWidget;
      case CustomWidgetType.table:
        return CustomTableWidget(
            name: "",
            header: "",
            sortAsc: true,
            initialSortColumn: 1,
            initialSortEnabled: false,
            elementsPerPage: 10,
            columns: {}).settingWidget;
      case CustomWidgetType.graph:
        return GraphWidget(name: "name").settingWidget;
      case CustomWidgetType.colorPallete:
        return CustomColorPalleteWidget(name: "", pickersEnabled: {})
            .settingWidget;
    }
  }

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
        return "Color Pallete";
      default:
        return toString();
    }
  }
}

abstract class CustomWidget {
  static String typeID = "-1";
  @Deprecated("Please don't use this")
  String? name;
  CustomWidgetType? type;
  Map<String, dynamic>? settings;

  CustomWidget(
      {required this.name, required this.type, required this.settings});

  CustomWidget.edit({required this.type});

  Widget get widget;

  CustomWidgetSettingWidget get settingWidget;

  factory CustomWidget.fromJSON(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();

  CustomWidget clone();
}

abstract class CustomWidgetSettingWidget {
  bool validate();

  CustomWidget get customWidget;

  List<GlobalKey> get showKeys;
}

abstract class CustomWidgetSettingStatelessWidget extends StatelessWidget
    implements CustomWidgetSettingWidget {
  const CustomWidgetSettingStatelessWidget({Key? key}) : super(key: key);
}

abstract class CustomWidgetSettingStatefulWidget extends StatefulWidget
    implements CustomWidgetSettingWidget {
  const CustomWidgetSettingStatefulWidget({Key? key}) : super(key: key);
}
