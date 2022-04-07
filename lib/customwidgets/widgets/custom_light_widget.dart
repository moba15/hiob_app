import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_light_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/light_widget_settings.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../manager/manager.dart';

class CustomLightWidget extends CustomWidget {
  static const CustomWidgetType TYPE = CustomWidgetType.light;
  DataPoint? onDataPoint;
  DataPoint? briDataPoint;
  int briMax;
  int briMin;
  int briSteps;
  DataPoint? reachableDataPoint;
  String briDisplay = "Brightness";
  String reachableDisplay = "Reachable";
  String display = "Display";
  CustomLightWidget({required String? name, this.onDataPoint, this.briDataPoint, this.briMax = 100, this.briMin = 1, this.reachableDataPoint, this.briSteps = 1}) : super(name: name, type: TYPE, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget => CustomLightWidgetSettingWidget(customLightWidget: this);

  factory CustomLightWidget.fromJson(Map<String, dynamic> json) {
    DataPoint? onDataPoint = Manager.instance?.deviceManager.getIoBrokerDataPointByObjectID(json["onDataPointID"]);
    DataPoint? briDataPoint = json["briDataPointID"] == null ? null : Manager.instance?.deviceManager.getIoBrokerDataPointByObjectID(json["briDataPointID"]);
    DataPoint? reachableDataPoint = json["reachableDataPointID"] == null ? null : Manager.instance?.deviceManager.getIoBrokerDataPointByObjectID(json["reachableDataPointID"]);

    return CustomLightWidget(
      name: json["name"],
      briMax: json["briMax"],
      briMin: json["briMin"],
      onDataPoint: onDataPoint,
      reachableDataPoint: reachableDataPoint,
      briDataPoint: briDataPoint,
      briSteps: json["briSteps"],

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
    "display": display,
    "briDisplay": briDisplay,
    "reachableDisplay": reachableDisplay,
  };

  @override
  Widget get widget => CustomLightWidgetView(customLightWidget: this,);

}