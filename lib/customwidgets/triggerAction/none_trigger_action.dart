import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/none_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart'
    as new_widget;

class NoneTriggerAction extends TriggerAction {
  String id = Manager.instance.getRandString(12);
  DataPoint? dataPoint;
  int round;
  Map<String, String>? displayRules;
  String? unit;
  NoneTriggerAction({
    required this.dataPoint,
    required this.displayRules,
    this.round = 2,
    this.unit,
  });

  factory NoneTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectIDSync(json["dataPoint"] ?? "");
    return NoneTriggerAction(
      dataPoint: dataPoint,
      displayRules: Map.from(jsonDecode(json["displayRules"]) ?? {}),
      round: json["round"] ?? 2,
      unit: json["unit"],
    );
  }
  @override
  bool isTypeAllowed(value) {
    return true;
  }

  @override
  TriggerActionSetting get settings =>
      NoneTriggerActionSettings(noneTriggerAction: this);

  @override
  Map<String, dynamic> toJson() => {
    "type": type.toString(),
    "dataPoint": dataPoint?.id,
    "displayRules": jsonEncode(displayRules),
    "round": round,
    "unit": unit,
  };

  @override
  TriggerActionType get type => TriggerActionType.none;

  @override
  Widget getWidget({VoidCallback? onLongTab}) => throw UnimplementedError();

  @override
  bool validate() {
    return dataPoint != null;
  }

  @override
  String toString() {
    return "ID: $id";
  }

  @override
  void trigger() {}

  @override
  CustomWidget migrate({required String id, required String name}) {
    return new_widget.CustomValueWidget(
      id: id,
      name: name,
      dataPoint: dataPoint?.id,
      valueMapper: displayRules ?? {},
      round: round,
      suffix: " $unit",
    );
  }
}
