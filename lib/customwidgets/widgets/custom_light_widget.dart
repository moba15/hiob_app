import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_light_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/light_widget_settings.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../manager/manager.dart';

class CustomLightWidget extends CustomWidget {
  DataPoint? onDataPoint;
  DataPoint? briDataPoint;
  int briMax;
  int briMin;
  int briSteps;
  DataPoint? reachableDataPoint;
  String? value;
  String briDisplay = "Brightness";
  String reachableDisplay = "Reachable";

  CustomLightWidget(
      {required String? name,
      this.onDataPoint,
      this.briDataPoint,
      this.briMax = 100,
      this.briMin = 0,
      this.reachableDataPoint,
      this.briSteps = 10,
      this.value,
      this.briDisplay = "Brightness"})
      : super(name: name, type: CustomWidgetType.light, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomLightWidgetSettingWidget(customLightWidget: this);

  factory CustomLightWidget.fromJson(Map<String, dynamic> json) {
    DataPoint? onDataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectID(json["onDataPointID"] ?? "");
    DataPoint? briDataPoint = json["briDataPointID"] == null
        ? null
        : Manager.instance.deviceManager
            .getIoBrokerDataPointByObjectID(json["briDataPointID"]);
    DataPoint? reachableDataPoint = json["reachableDataPointID"] == null
        ? null
        : Manager.instance.deviceManager
            .getIoBrokerDataPointByObjectID(json["reachableDataPointID"]);

    return CustomLightWidget(
      name: json["name"],
      briMax: json["briMax"],
      briMin: json["briMin"],
      onDataPoint: onDataPoint,
      reachableDataPoint: reachableDataPoint,
      briDataPoint: briDataPoint,
      briSteps: json["briSteps"],
      value: json["value"],
      briDisplay: json["briDisplay"],
    );
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
  Widget get widget => CustomLightWidgetView(
        customLightWidget: this,
      );

  @override
  CustomWidget clone() {
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
}
