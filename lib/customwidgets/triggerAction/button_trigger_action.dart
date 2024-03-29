import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/button_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';

import '../../device/datapoint/datapoint.dart';
import '../../manager/manager.dart';

class ButtonTriggerAction extends TriggerAction {
  String? label;
  DataPoint? dataPoint;
  ButtonTriggerAction({required this.label, required this.dataPoint});

  factory ButtonTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    return ButtonTriggerAction(
        dataPoint: dataPoint, label: json["label"] ?? "No Label Set");
  }

  @override
  Widget getWidget({VoidCallback? onLongTab}) => const Text("asd");

  @override
  bool isTypeAllowed(value) {
    return true;
  }

  @override
  // TODO: implement settings
  TriggerActionSetting? get settings =>
      ButtonTriggerActionSettings(buttonTriggerAction: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "label": label,
        "dataPoint": dataPoint?.id,
      };

  @override
  void trigger() {}

  @override
  TriggerActionType get type => TriggerActionType.button;

  @override
  bool validate() {
    return dataPoint != null;
  }
}
