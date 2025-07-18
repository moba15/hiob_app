import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/switch_trigger_action.dart';

class SwitchTriggerView extends StatelessWidget {
  final SwitchTriggerAction switchTriggerAction;
  final VoidCallback onLongTab;
  const SwitchTriggerView({
    Key? key,
    required this.switchTriggerAction,
    required this.onLongTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (switchTriggerAction.dataPoint == null) {
      return const Text("Device not found");
    }
    return const Text("Not implemented yet");
  }
}
