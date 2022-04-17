import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/advanced_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/advanced_widget_settings.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/manager.dart';

class AdvancedCustomWidget extends CustomWidget {
  static const CustomWidgetType TYPE = CustomWidgetType.advanced;
  String? value;
  TriggerAction? bodyTriggerAction;
  String? bodyIconID;

  String? subTitle;
  DataPoint? subTitleDataPoint;

  AdvancedCustomWidget(
      {required name, this.value, this.bodyTriggerAction, this.subTitle, this.subTitleDataPoint, this.bodyIconID})
      : super(name: name, type: TYPE, settings: {});

  AdvancedCustomWidget.edit() : super.edit(type:TYPE);

  @override
  Map<String, dynamic> toJson() => {
    "type": CustomWidgetType.advanced.toString(),
    "bodyTriggerAction": jsonEncode(bodyTriggerAction?.toJson()),
    "subTitle": subTitle,
    "subTitleDataPoint": subTitleDataPoint?.id,
    "name": name,
    "value": value,
    "bodyIconID": bodyIconID
  };

  factory AdvancedCustomWidget.fromJson(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance!.deviceManager.getIoBrokerDataPointByObjectID(json["subTitleDataPoint"].toString());
    TriggerAction triggerAction = TriggerAction.fromJSON(jsonDecode(json["bodyTriggerAction"] ?? "{}"));
    return AdvancedCustomWidget(
        name: json["name"],
        subTitle: json["subTitle"],
        subTitleDataPoint: dataPoint,
        bodyTriggerAction: triggerAction, //TODO:
        value: json["value"],
        bodyIconID: json["bodyIconID"]

    );
  }
  @override
  CustomWidgetSettingWidget get settingWidget { return AdvancedWidgetSettings(advancedCustomWidget: this,);}


  @override
  Widget get widget => AdvancedWidgetView(advancedCustomWidget: this,);
}


