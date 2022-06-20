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
    print(advancedCustomWidget.customAlertDialogWidget?.templates != null);
    return advancedCustomWidget.bodyTriggerAction != null && advancedCustomWidget.bodyTriggerAction!.validate() &&
        advancedCustomWidget.customAlertDialogWidget != null;
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Main body:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),

          TriggerActionSelectionTemplate(
            onChange: (trigger) => {advancedCustomWidget.bodyTriggerAction = trigger},
            preSelectedTriggerAction: advancedCustomWidget.bodyTriggerAction,
          ),

          Container(
            height: 20,

          ),
          ExpansionTile(
            title: const Text("Popup menu:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            leading: const Icon(Icons.menu),

            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right:  15),
                child: (advancedCustomWidget.customAlertDialogWidget?.settingWidget ?? const Text("Error 404") )as Widget,
              )
            ],
          ),






        ],
      ),
    );
  }

}