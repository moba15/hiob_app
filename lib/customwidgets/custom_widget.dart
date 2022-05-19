import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';

enum CustomWidgetType {
  simpleSwitch,
  simpleValue,
  advanced,
  light,
  group,
  line,
  webView,
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
        return CustomWebViewWidget(name: null, url: null).settingWidget;
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
      default:
        return "Error";
    }
  }
}

abstract class CustomWidget {
  static String typeID = "-1";
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


}

abstract class CustomWidgetSettingStatelessWidget extends StatelessWidget implements CustomWidgetSettingWidget{
  const CustomWidgetSettingStatelessWidget({Key? key}) : super(key: key);




}

abstract class CustomWidgetSettingStatefulWidget extends StatefulWidget implements CustomWidgetSettingWidget {
  const CustomWidgetSettingStatefulWidget({Key? key}) : super(key: key);


}
