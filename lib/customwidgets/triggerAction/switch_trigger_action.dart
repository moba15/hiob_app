import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/switch_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/device/state/state.dart';

import '../../manager/manager.dart';

class SwitchTriggerAction extends TriggerAction {
  DataPoint? dataPoint;
  dynamic switchTrue;
  dynamic switchFalse;

  SwitchTriggerAction(
      {required this.dataPoint,
      this.switchFalse = false,
      this.switchTrue = true});

  factory SwitchTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    return SwitchTriggerAction(
        dataPoint: dataPoint,
        switchFalse: json["switchFalse"],
        switchTrue: json["switchTrue"]);
  }

  @override
  bool isTypeAllowed(value) {
    return true;
  }

  @override
  TriggerActionSetting? get settings =>
      SwitchTriggerActionSettings(switchTriggerAction: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "dataPoint": dataPoint?.id,
        "switchTrue": switchTrue,
        "switchFalse": switchFalse
      };

  @override
  void trigger() {}

  @override
  TriggerActionType get type => TriggerActionType.handleSwitch;

  @override
  bool validate() {
    return dataPoint != null && switchTrue != null && switchFalse != null;
  }

  @override
  Widget getWidget({VoidCallback? onLongTab}) => const Text("asdasdasd");
}
