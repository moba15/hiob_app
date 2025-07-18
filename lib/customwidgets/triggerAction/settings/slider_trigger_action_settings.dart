import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/triggerAction/slider_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/utils/theme.dart';

import '../../../manager/manager.dart';

class SliderTriggerActionSettings extends TriggerActionSetting {
  final SliderTriggerAction sliderTriggerAction;
  final GlobalKey datapointKey = GlobalKey();
  final GlobalKey sliderKey = GlobalKey();

  SliderTriggerActionSettings({super.key, required this.sliderTriggerAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Showcase(
          key: datapointKey,
          title: "Datapoint",
          description: "The Datapoint which will be controlled by the Slider",
          child: DeviceSelection(
            customWidgetManager: Manager.instance.customWidgetManager,
            onDeviceSelected: (d) => {sliderTriggerAction.dataPoint == null},
            onDataPointSelected: (d) => {sliderTriggerAction.dataPoint = d},
            selectedDevice: sliderTriggerAction.dataPoint?.device,
            selectedDataPoint: sliderTriggerAction.dataPoint,
            dataPointLabel: "Datapoint",
            deviceLabel: "Device",
          ),
        ),
        Showcase(
            key: sliderKey,
            title: "Slider Settings",
            description: "Different settings for the Slider",
            child: InputFieldContainer.inputContainer(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: sliderTriggerAction.min.toString())),
                      decoration: const InputDecoration(labelText: "Min"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (int.tryParse(newValue.text) == null &&
                              newValue.text != "" &&
                              newValue.text != "-") {
                            return oldValue;
                          } else {
                            return newValue;
                          }
                        })
                      ],
                      onChanged: (v) =>
                          sliderTriggerAction.min = int.tryParse(v) ?? 0,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: sliderTriggerAction.max.toString())),
                      decoration: const InputDecoration(labelText: "Max"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (int.tryParse(newValue.text) == null &&
                              newValue.text != "" &&
                              newValue.text != "-") {
                            return oldValue;
                          } else {
                            return newValue;
                          }
                        })
                      ],
                      onChanged: (v) =>
                          sliderTriggerAction.max = int.tryParse(v) ?? 0,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: sliderTriggerAction.steps.toString())),
                      decoration: const InputDecoration(labelText: "Division"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (v) =>
                          sliderTriggerAction.steps = int.tryParse(v) ?? 0,
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      [datapointKey, sliderKey];
}
