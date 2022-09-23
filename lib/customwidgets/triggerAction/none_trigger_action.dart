import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/none_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/manager.dart';

class NoneTriggerAction extends TriggerAction  {
  String id = Manager.instance!.getRandString(12);
  DataPoint? dataPoint;
  int round;
  Map<String, String>? displayRules;
  String? unit;
  NoneTriggerAction({required this.dataPoint, required this.displayRules, this.round = 2, this.unit});
  
  factory NoneTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance?.deviceManager.getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    return NoneTriggerAction(dataPoint: dataPoint, displayRules: Map.from(jsonDecode(json["displayRules"]) ?? {}), round: json["round"] ?? 2, unit: json["unit"]);
  }
  @override
  bool isTypeAllowed(value) {
    return true;
  }

  @override
  TriggerActionSetting get settings  => NoneTriggerActionSettings(noneTriggerAction: this);

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
    return "ID: " + id;
  }

  @override
  void trigger() {
  }

}