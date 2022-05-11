import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/simple_switch_settings.dart';
import 'package:smart_home/customwidgets/widgets/view/simple_switch_widget_view.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/manager.dart';

import '../../device/device.dart';

class CustomSimpleSwitchWidget extends CustomWidget {
  String? value;
  Device? device;
  DataPoint? dataPoint;
  String? buttonText;

  CustomSimpleSwitchWidget(
      {required this.value, required name, required this.device, this.dataPoint, this.buttonText})
      : super(
            name: name,
            type: CustomWidgetType.simpleSwitch,
            settings: {"text": value, "device": device?.id});

  CustomSimpleSwitchWidget.edit() : super.edit(type:CustomWidgetType.simpleSwitch);

  @override
  Map<String, dynamic> toJson() => {

    "type": type.toString(),
    "value": value,
    "device": device?.id, //Device ID
    "dataPoint": dataPoint?.id, // DataPoint ID
    "name": name,
    "buttonText": buttonText,
  };

  factory CustomSimpleSwitchWidget.fromJson(Map<String, dynamic> json) {
    Device? device = Manager.instance?.deviceManager.getDevice(json["device"] ?? "");
    //DataPoint? onDataPoint = Manager.instance?.deviceManager.getIoBrokerDataPointByObjectID(json["dataPoint"]);
    return CustomSimpleSwitchWidget(
      value: json["value"],
      name: json["name"],
      device: device,
      dataPoint: device?.getDataPoint(id: json["dataPoint"] ?? ""),
      buttonText: json["buttonText"]
    );
  }
  @override
  CustomWidgetSettingWidget get settingWidget {return CustomSwitchWidgetSettingWidget(customSimpleSwitchWidget: this,);}


  @override
  Widget get widget => SimpleSwitchWidgetView(customSimpleSwitchWidget: this);
}


