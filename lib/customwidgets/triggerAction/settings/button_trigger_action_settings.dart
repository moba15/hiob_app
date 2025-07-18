import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/triggerAction/button_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class ButtonTriggerActionSettings extends TriggerActionSetting {
  final ButtonTriggerAction buttonTriggerAction;
  final GlobalKey datapointKey = GlobalKey();
  final GlobalKey datapointLabel = GlobalKey();

  ButtonTriggerActionSettings({Key? key, required this.buttonTriggerAction})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Showcase(
          key: datapointKey,
          title: "Datapoint",
          description: "The Datapoint which will be controlled by the Button",
          child: DeviceSelection(
            onDeviceSelected: (d) => {
              if (d == null) buttonTriggerAction.dataPoint = null,
            },
            onDataPointSelected: (d) => buttonTriggerAction.dataPoint = d,
            customWidgetManager: Manager.instance.customWidgetManager,
            deviceLabel: "Device",
            dataPointLabel: "Datapoint",
            selectedDevice: buttonTriggerAction.dataPoint?.device,
            selectedDataPoint: buttonTriggerAction.dataPoint,
          ),
        ),
        Showcase(
          key: datapointLabel,
          title: "Button Text",
          description: "The Text inside the Pressable Button (e.g. On/Off)",
          child: InputFieldContainer.inputContainer(
            child: TextFormField(
              initialValue: buttonTriggerAction.label,
              onChanged: (v) => {
                buttonTriggerAction.label = v,
                if (v.isEmpty) buttonTriggerAction.label = null,
              },
              decoration: const InputDecoration(
                label: Text("Button Label"),
                hintText: "Button Label",
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [
    datapointKey,
    datapointLabel,
  ];
}
