import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/advanced_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/advanced_widget_settings.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/manager.dart';

class AdvancedCustomWidget extends CustomWidgetDeprecated {
  String? value;
  TriggerAction? mainBody;
  String? bodyIconID;

  String? subTitle;
  DataPoint? subTitleDataPoint;

  CustomAlertDialogWidget? customAlertDialogWidget =
      CustomAlertDialogWidget(name: "", title: "");

  AdvancedCustomWidget(
      {required name,
      this.value,
      this.mainBody,
      this.subTitle,
      this.subTitleDataPoint,
      this.bodyIconID,
      this.customAlertDialogWidget})
      : super(
            name: name,
            type: CustomWidgetTypeDeprecated.advanced,
            settings: {});

  AdvancedCustomWidget.edit()
      : super.edit(type: CustomWidgetTypeDeprecated.advanced);

  @override
  Map<String, dynamic> toJson() => {
        "type": CustomWidgetTypeDeprecated.advanced.toString(),
        "mainBody": jsonEncode(mainBody?.toJson()),
        "subTitle": subTitle,
        "subTitleDataPoint": subTitleDataPoint?.id,
        "name": name,
        "value": value,
        "bodyIconID": bodyIconID,
        "customAlertDialogWidget": customAlertDialogWidget,
      };

  factory AdvancedCustomWidget.fromJson(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectID(json["subTitleDataPoint"].toString());
    TriggerAction triggerAction = TriggerAction.fromJSON(
        jsonDecode(json["bodyTriggerAction"] ?? (json["mainBody"] ?? "{}")));
    return AdvancedCustomWidget(
      name: json["name"],
      subTitle: json["subTitle"],
      subTitleDataPoint: dataPoint,
      mainBody: triggerAction, //TODO:
      value: json["value"],
      bodyIconID: json["bodyIconID"],
      customAlertDialogWidget: json["customAlertDialogWidget"] == null
          ? CustomAlertDialogWidget(
              name: "Not Set",
            )
          : CustomAlertDialogWidget.fromJSON(json["customAlertDialogWidget"]),
    );
  }
  @override
  CustomWidgetSettingWidget get settingWidget {
    return AdvancedWidgetSettings(
      advancedCustomWidget: this,
    );
  }

  @override
  Widget get widget => AdvancedWidgetView(
        advancedCustomWidget: this,
      );

  @override
  CustomWidgetDeprecated clone() {
    return AdvancedCustomWidget(
        name: name,
        value: value,
        mainBody: mainBody,
        subTitle: subTitle,
        subTitleDataPoint: subTitleDataPoint,
        bodyIconID: bodyIconID,
        customAlertDialogWidget: customAlertDialogWidget);
  }
}
