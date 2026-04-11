import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';

class CustomDivisionLineWidgetDeprecated extends CustomWidgetDeprecated {
  Color color;
  int thickness;

  CustomDivisionLineWidgetDeprecated({
    required super.name,
    this.color = Colors.black,
    this.thickness = 3,
  }) : super(type: CustomWidgetTypeDeprecated.divisionLine, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget =>
      throw Deprecated("Not supported anymore");
  @override
  Map<String, dynamic> toJson() => throw Deprecated("Not supported anymore");

  factory CustomDivisionLineWidgetDeprecated.fromJson(
    Map<String, dynamic> json,
  ) {
    return CustomDivisionLineWidgetDeprecated(
      name: json["name"],
      color: Color.fromRGBO(json["colorR"], json["colorG"], json["colorB"], 1),
      thickness: json["thickness"],
    );
  }

  @override
  Widget get widget => Divider(thickness: thickness.toDouble());

  @override
  CustomWidgetDeprecated clone() {
    throw Deprecated("Not supported anymore");
  }

  @override
  CustomWidget migrate({required String id, required String name}) {
    return CustomDivisionlineWidget(id: id, name: name, thickness: thickness);
  }
}
