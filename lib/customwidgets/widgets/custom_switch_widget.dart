import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/simple_switch_settings.dart';
import 'package:smart_home/customwidgets/widgets/view/simple_switch_widget_view.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/manager.dart';

import '../../device/device.dart';

class CustomSimpleSwitchWidget extends CustomWidget {
  static const CustomWidgetType TYPE = CustomWidgetType.simpleSwitch;
  String? text;
  Device? device;
  DataPoint? dataPoint;

  CustomSimpleSwitchWidget(
      {required this.text, required name, required this.device, this.dataPoint})
      : super(
            name: name,
            type: TYPE,
            settings: {"text": text, "device": device?.id});

  CustomSimpleSwitchWidget.edit() : super.edit(type:TYPE);

  @override
  Map<String, dynamic> toJson() => {

    "type": CustomWidgetType.simpleSwitch.toString(),
    "text": text,
    "device": device?.id, //Device ID
    "dataPoint": dataPoint?.id, // DataPoint ID
  };

  factory CustomSimpleSwitchWidget.fromJson(Map<String, dynamic> json) {
    Device? device = Manager.instance?.deviceManager.getDevice(json["device"]);
    return CustomSimpleSwitchWidget(
      text: json["text"],
      name: json["name"],
      device: device,
      dataPoint: device?.getDataPoint(id: json["dataPoint"]),

    );
  }
  @override
  CustomWidgetSettingWidget get settingWidget {return CustomSwitchWidgetSettingWidget(customSimpleSwitchWidget: this,);}


  @override
  Widget get widget => SimpleSwitchWidgetView(customSimpleSwitchWidget: this);
}


