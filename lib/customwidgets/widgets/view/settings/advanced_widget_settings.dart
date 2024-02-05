// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/trigger_action_selection.dart';

class AdvancedWidgetSettings extends CustomWidgetSettingStatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final GlobalKey valueKey = GlobalKey();
  final GlobalKey mainBodyKey = GlobalKey();
  final GlobalKey popupKey = GlobalKey();
  AdvancedWidgetSettings({Key? key, required this.advancedCustomWidget})
      : super(key: key);

  TriggerActionSetting? setting;

  @override
  CustomWidget get customWidget => advancedCustomWidget;

  @override
  bool validate() {
    return advancedCustomWidget.bodyTriggerAction != null &&
        advancedCustomWidget.bodyTriggerAction!.validate() &&
        advancedCustomWidget.customAlertDialogWidget != null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Showcase(
            key: valueKey,
            title: "Value",
            description: "Text next to the button (if not set it is the Name)",
            child: TextField(
              onChanged: (v) => {
                advancedCustomWidget.value = v,
                if (v.isEmpty) advancedCustomWidget.value = null
              },
              controller:
                  TextEditingController(text: advancedCustomWidget.value),
              decoration: const InputDecoration(labelText: "Value"),
            ),
          ),
          Container(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Main body:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Showcase(
            key: mainBodyKey,
            title: "Main Body",
            description:
                "Here you can setup the main body of this widget, you can choose between a lot different widget types",
            child: TriggerActionSelectionTemplate(
              onChange: (trigger, settings) => {
                advancedCustomWidget.bodyTriggerAction = trigger,
                setting = settings
              },
              preSelectedTriggerAction: advancedCustomWidget.bodyTriggerAction,
            ),
          ),
          Container(
            height: 20,
          ),
          Showcase(
            key: popupKey,
            title: "Popup Menu",
            description:
                "Here you can setup a popupmenu, which can contains other different widgets and will be open if you press long enough on the widget",
            child: ExpansionTile(
              title: const Text(
                "Popup menu:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.menu),
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: (advancedCustomWidget
                          .customAlertDialogWidget?.settingWidget ??
                      const Text("Error 404")) as Widget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys {
    return [valueKey, mainBodyKey, ...?setting?.showKeys, popupKey];
  }
}
