import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/button_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';

class ButtonTriggerActionSettings extends TriggerActionSetting {
  final ButtonTriggerAction buttonTriggerAction;

  const ButtonTriggerActionSettings(
      {Key? key, required this.buttonTriggerAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeviceSelection(
          onDeviceSelected: (d) =>
              {if (d == null) buttonTriggerAction.dataPoint = null},
          onDataPointSelected: (d) => buttonTriggerAction.dataPoint = d,
          customWidgetManager: Manager.instance!.customWidgetManager,
          deviceLabel: "Device",
          dataPointLabel: "Datapoint",
          selectedDevice: buttonTriggerAction.dataPoint?.device,
          selectedDataPoint: buttonTriggerAction.dataPoint,
        ),
        TextFormField(
          initialValue: buttonTriggerAction.label,
          onChanged: (v) => {buttonTriggerAction.label = v, if(v.isEmpty) buttonTriggerAction.label = null},
          decoration: const InputDecoration(label: Text("Button Label"), hintText: "Button Label"),

        )
      ],
    );
  }
}
