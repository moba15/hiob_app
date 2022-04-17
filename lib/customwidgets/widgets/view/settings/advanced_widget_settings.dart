import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/trigger_action_selection.dart';

class AdvancedWidgetSettings extends CustomWidgetSettingStatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  const AdvancedWidgetSettings({Key? key, required this.advancedCustomWidget}) : super(key: key);




  @override
  CustomWidget get customWidget => advancedCustomWidget;

  @override
  bool validate() {
    return advancedCustomWidget.bodyTriggerAction != null && advancedCustomWidget.bodyTriggerAction!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (v) => {advancedCustomWidget.value = v, if(v.isEmpty) advancedCustomWidget.value = null},
            controller: TextEditingController(text: advancedCustomWidget.value),
            decoration: const InputDecoration(labelText: "Value"),
          ),
          Container(
            height: 20,
          ),
          TriggerActionSelectionTemplate(
            onChange: (trigger) => {advancedCustomWidget.bodyTriggerAction = trigger},
            preSelectedTriggerAction: advancedCustomWidget.bodyTriggerAction,
          ),

        ],
      ),
    );
  }

}