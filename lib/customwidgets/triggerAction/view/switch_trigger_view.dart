import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/switch_trigger_action.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

class SwitchTriggerView extends StatelessWidget {
  final SwitchTriggerAction switchTriggerAction;
  final VoidCallback onLongTab;
  const SwitchTriggerView({Key? key, required this.switchTriggerAction, required this.onLongTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (switchTriggerAction.dataPoint == null) {
      return const Text("Device not found");
    }
    final bloc = DataPointBloc(switchTriggerAction.dataPoint!);
    return const Text("Not implemented yet");
  }
}
