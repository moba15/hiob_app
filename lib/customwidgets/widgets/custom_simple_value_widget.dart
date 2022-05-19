import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/simple_value_settings.dart';
import 'package:smart_home/customwidgets/widgets/view/simple_value_widget_view.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/manager.dart';

import '../../device/device.dart';

class CustomSimpleValueWidget extends CustomWidget {
  Device? device;
  DataPoint? dataPoint;
  int? round = 2;
  String? value;
  String? unit;

  CustomSimpleValueWidget(
      {required name, required this.device, this.dataPoint, this.round, this.value, this.unit})
      : super(
            name: name,
            type: CustomWidgetType.simpleValue,
            settings: {"device": device?.id});

  CustomSimpleValueWidget.edit() : super.edit(type: CustomWidgetType.simpleValue);

  @override
  Map<String, dynamic> toJson() => {
    "type": CustomWidgetType.simpleValue.toString(),
    "device": device?.id, //Device ID
    "dataPoint": dataPoint?.id, // DataPoint ID
    "round": round,
    "name": name,
    "value": value,
    "unit": unit,
  };

  factory CustomSimpleValueWidget.fromJson(Map<String, dynamic> json) {
    Device? device = Manager.instance?.deviceManager.getDevice(json["device"] ?? "");
    return CustomSimpleValueWidget(
      name: json["name"],
      round: json["round"],
      device: device,
      dataPoint: device?.getDataPoint(id: json["dataPoint"] ?? ""),
      value: json["value"],
      unit: json["unit"]

    );
  }
  @override
  CustomWidgetSettingWidget get settingWidget {return CustomSimpleValueWidgetSettingWidget(customSimpleValueWidget: this,);}


  @override
  Widget get widget => SimpleValueWidgetView(customSimpleValueWidget: this);

  @override
  CustomWidget clone() {
    return CustomSimpleValueWidget(name: name, device: device, dataPoint: dataPoint, unit: unit, round: round, value: value);
  }
}


