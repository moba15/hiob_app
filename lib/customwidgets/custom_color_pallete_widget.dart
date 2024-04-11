import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_color_pallete_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_color_pallete_widget_settings.dart';

class CustomColorPalleteWidget extends CustomWidget {
  final String? value;
  CustomColorPalleteWidget({required String? name, this.value})
      : super(name: name, type: CustomWidgetType.colorPallete, settings: {});

  @override
  CustomWidget clone() {
    return CustomColorPalleteWidget(name: name, value: value);
  }

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomColorPalleteWidgetSettings(customColorPalleteWidget: this);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type.toString(),
      "name": name,
      "value": value,
    };
  }

  @override
  // TODO: implement widget
  Widget get widget => CustomColorPalleteWidgetView(colorPalleteWidget: this);

  factory CustomColorPalleteWidget.fromJson(Map<String, dynamic> json) {
    return CustomColorPalleteWidget(name: json["name"], value: json["value"]);
  }
}
