import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/cutsom_divider_settigs.dart';

class CustomDivisionLineWidget extends CustomWidgetDeprecated {
  Color color;
  int thickness;

  CustomDivisionLineWidget(
      {required String? name, this.color = Colors.black, this.thickness = 3})
      : super(name: name, type: CustomWidgetTypeDeprecated.line, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomDividerSettings(customDivisionLineWidget: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "name": name,
        "colorR": color.red,
        "colorB": color.blue,
        "colorG": color.green,
        "thickness": thickness,
      };

  factory CustomDivisionLineWidget.fromJson(Map<String, dynamic> json) {
    return CustomDivisionLineWidget(
        name: json["name"],
        color:
            Color.fromRGBO(json["colorR"], json["colorG"], json["colorB"], 1),
        thickness: json["thickness"]);
  }

  @override
  Widget get widget => Divider(
        thickness: thickness.toDouble(),
      );

  @override
  CustomWidgetDeprecated clone() {
    return CustomDivisionLineWidget(
        name: name, color: color, thickness: thickness);
  }

  @override
  CustomWidget migrate({required String id}) {
    return CustomDivisionlineWidget(id: id, name: name ?? "No name found");
  }
}
