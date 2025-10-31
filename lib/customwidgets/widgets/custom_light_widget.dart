import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_light_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/light_widget_settings.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart'
    as new_widget;
import '../../manager/manager.dart';

class CustomLightWidget extends CustomWidgetDeprecated {
  DataPoint? onDataPoint;
  DataPoint? briDataPoint;
  int briMax;
  int briMin;
  int briSteps;
  DataPoint? reachableDataPoint;
  String? value;
  String briDisplay = "Brightness";
  String reachableDisplay = "Reachable";

  CustomLightWidget({
    required super.name,
    this.onDataPoint,
    this.briDataPoint,
    this.briMax = 100,
    this.briMin = 0,
    this.reachableDataPoint,
    this.briSteps = 10,
    this.value,
    this.briDisplay = "Brightness",
  }) : super(type: CustomWidgetTypeDeprecated.light, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomLightWidgetSettingWidget(customLightWidget: this);

  factory CustomLightWidget.fromJson(Map<String, dynamic> json) {
    throw UnsupportedError("Not supported anymore");
  }

  @override
  Map<String, dynamic> toJson() => {
    "type": type.toString(),
    "name": name,
    "onDataPointID": onDataPoint?.id,
    "briDataPointID": briDataPoint?.id,
    "reachableDataPointID": reachableDataPoint?.id,
    "briMax": briMax,
    "briMin": briMin,
    "briSteps": briSteps,
    "briDisplay": briDisplay,
    "reachableDisplay": reachableDisplay,
    "value": value,
  };

  @override
  Widget get widget => CustomLightWidgetView(customLightWidget: this);

  @override
  CustomWidgetDeprecated clone() {
    return CustomLightWidget(
      name: name,
      onDataPoint: onDataPoint,
      value: value,
      briSteps: briSteps,
      briMax: briMax,
      briDataPoint: briDataPoint,
      reachableDataPoint: reachableDataPoint,
      briMin: briMin,
      briDisplay: briDisplay,
    );
  }

  @override
  CustomWidget migrate({required String id, required String name}) {
    return new_widget.CustomSwitchWidget(
      id: id,
      name: name,
      dataPoint: onDataPoint?.id,
      label: value,
      customPopupmenu: CustomPopupmenu(
        customWidgets: [
          CustomSliderWidget(
            id: Manager().getRandString(12),
            name: "Brightness",
            dataPoint: briDataPoint?.id,
          ),
        ],
      ),
    );
  }
}
