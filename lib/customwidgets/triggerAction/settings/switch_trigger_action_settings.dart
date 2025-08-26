import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/triggerAction/switch_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/utils/theme.dart';

import '../../../manager/manager.dart';
import '../../widgets/view/settings/templates/device_selection.dart';

class SwitchTriggerActionSettings extends TriggerActionSetting {
  final SwitchTriggerAction switchTriggerAction;
  final GlobalKey datapointKey = GlobalKey();
  final GlobalKey sendOnKey = GlobalKey();
  final GlobalKey sendOffKey = GlobalKey();

  SwitchTriggerActionSettings({super.key, required this.switchTriggerAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Showcase(
          key: datapointKey,
          title: "Datapoint",
          description: "The Datapoint which will be controlled by the Handle",
          child: DeviceSelection(
            customWidgetManager: Manager.instance.customWidgetManager,
            onDeviceSelected: (d) => {switchTriggerAction.dataPoint == null},
            onDataPointSelected: (d) => {switchTriggerAction.dataPoint = d},
            selectedDevice: switchTriggerAction.dataPoint?.device,
            selectedDataPoint: switchTriggerAction.dataPoint,
            dataPointLabel: "Datapoint",
            deviceLabel: "Device",
          ),
        ),
        Showcase(
          key: sendOnKey,
          title: "Send if on",
          description: "This value will be sent if the handle is switched on",
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 8,
                child: InputFieldContainer.inputContainer(
                  child: TextFormField(
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: switchTriggerAction.switchTrue.toString(),
                      ),
                    ),
                    decoration: const InputDecoration(
                      hintText: "true",
                      labelText: "Send if on",
                    ),
                    autocorrect: false,
                    onChanged: (v) {
                      if (v.isEmpty) {
                        switchTriggerAction.switchTrue = null;
                      } else {
                        int? i = int.tryParse(v.trim());
                        if (i != null) {
                          switchTriggerAction.switchTrue = i;
                        } else {
                          if (v.trim() == "true") {
                            switchTriggerAction.switchTrue = true;
                          } else if (v.trim() == "false") {
                            switchTriggerAction.switchTrue = false;
                          } else {
                            switchTriggerAction.switchTrue = v;
                          }
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Showcase(
          key: sendOffKey,
          title: "Send if off",
          description: "This value will be sent if the handle is switched off",
          child: Row(
            children: [
              Expanded(
                child: InputFieldContainer.inputContainer(
                  child: TextFormField(
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: switchTriggerAction.switchFalse.toString(),
                      ),
                    ),
                    decoration: const InputDecoration(
                      hintText: "false",
                      labelText: "Send if off",
                    ),
                    autocorrect: false,
                    onChanged: (v) {
                      if (v.isEmpty) {
                        switchTriggerAction.switchFalse = null;
                      } else {
                        int? i = int.tryParse(v.trim());
                        if (i != null) {
                          switchTriggerAction.switchFalse = i;
                        } else {
                          if (v.trim() == "true") {
                            switchTriggerAction.switchFalse = true;
                          } else if (v.trim() == "false") {
                            switchTriggerAction.switchFalse = false;
                          } else {
                            switchTriggerAction.switchFalse = v;
                          }
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [
    datapointKey,
    sendOnKey,
    sendOffKey,
  ];
}
