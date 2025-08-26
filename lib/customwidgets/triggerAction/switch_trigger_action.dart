import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/switch_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart'
    as new_widget;
import '../../manager/manager.dart';

class SwitchTriggerAction extends TriggerAction {
  DataPoint? dataPoint;
  dynamic switchTrue;
  dynamic switchFalse;

  SwitchTriggerAction({
    required this.dataPoint,
    this.switchFalse = false,
    this.switchTrue = true,
  });

  factory SwitchTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectIDSync(json["dataPoint"] ?? "");
    return SwitchTriggerAction(
      dataPoint: dataPoint,
      switchFalse: json["switchFalse"],
      switchTrue: json["switchTrue"],
    );
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
    "switchFalse": switchFalse,
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

  @override
  CustomWidget migrate({required String id, required String name}) {
    return new_widget.CustomSwitchWidget(
      id: id,
      name: name,
      dataPoint: dataPoint?.id,
      sendIfOff: switchFalse.toString(),
      sendIfOn: switchTrue.toString(),
    );
  }
}
