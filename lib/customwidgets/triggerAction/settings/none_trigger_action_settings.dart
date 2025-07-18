import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/triggerAction/none_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class NoneTriggerActionSettings extends TriggerActionSetting {
  final NoneTriggerAction noneTriggerAction;
  final GlobalKey dataPointKey = GlobalKey();
  final GlobalKey roundToKey = GlobalKey();
  final GlobalKey unitKey = GlobalKey();
  final GlobalKey textRulesKey = GlobalKey();
  NoneTriggerActionSettings({super.key, required this.noneTriggerAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Showcase(
          key: dataPointKey,
          title: "Datapoint",
          description: "The Datapoint which value will be shown",
          child: DeviceSelection(
            customWidgetManager: Manager.instance.customWidgetManager,
            onDataPointSelected: (d) => {noneTriggerAction.dataPoint = d},
            onDeviceSelected: (d) => {noneTriggerAction.dataPoint == null},
            selectedDataPoint: noneTriggerAction.dataPoint,
            selectedDevice: noneTriggerAction.dataPoint?.device,
          ),
        ),
        Showcase(
          key: roundToKey,
          title: "Round",
          description:
              "If the value of the datapoint is a number it will be round to x decimals",
          child: InputFieldContainer.inputContainer(
            child: TextField(
              controller: TextEditingController.fromValue(
                TextEditingValue(text: noneTriggerAction.round.toString()),
              ),
              decoration: const InputDecoration(labelText: "Round to"),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (v) => noneTriggerAction.round = int.tryParse(v) ?? 2,
            ),
          ),
        ),
        Showcase(
          key: unitKey,
          title: "Unit",
          description:
              "If set this will be written behind the actual value of the datapoint",
          child: InputFieldContainer.inputContainer(
            child: TextField(
              controller: TextEditingController.fromValue(
                TextEditingValue(text: noneTriggerAction.unit ?? ""),
              ),
              decoration: const InputDecoration(labelText: "Unit (optional)"),
              maxLength: 10,
              onChanged: (v) => {
                noneTriggerAction.unit = v,
                if (v.isEmpty) noneTriggerAction.unit = null,
              },
            ),
          ),
        ),
        Showcase(
          key: textRulesKey,
          title: "Text Rules",
          description: "Here you can map one value to an other",
          child: InputFieldContainer.inputContainer(
            child: _RulesSettings(noneTriggerAction: noneTriggerAction),
          ),
        ),
      ],
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [
    dataPointKey,
    roundToKey,
    unitKey,
    textRulesKey,
  ];
}

class _RulesSettings extends StatefulWidget {
  final NoneTriggerAction noneTriggerAction;
  const _RulesSettings({required this.noneTriggerAction});

  @override
  State<_RulesSettings> createState() => _RulesSettingsState();
}

class _RulesSettingsState extends State<_RulesSettings> {
  @override
  Widget build(BuildContext context) {
    final keys = widget.noneTriggerAction.displayRules?.keys.toList();
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(left: 10),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Text Rules: ", style: TextStyle(fontSize: 17)),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _RuleAddEditAlertDialog(
                  onAdd: (key, value) {
                    if (widget.noneTriggerAction.displayRules?.containsKey(
                          key,
                        ) ??
                        false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Rule Already exists!")),
                      );
                    }
                    setState(() {
                      widget.noneTriggerAction.displayRules ??= {};
                      widget.noneTriggerAction.displayRules?[key] = value;
                    });
                  },
                ),
              );
            },
            child: const Text("Add"),
          ),
        ],
      ),
      children: [
        for (String keyRule in keys ?? [])
          Dismissible(
            onDismissed: (d) {
              setState(() {
                widget.noneTriggerAction.displayRules?.remove(keyRule);
              });
            },
            key: ValueKey(keyRule),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Icon(Icons.delete_forever),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Icon(Icons.delete_forever),
              ),
            ),
            direction: DismissDirection.endToStart,
            child: ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (c) => _RuleAddEditAlertDialog(
                    onAdd: (key, value) {
                      setState(() {
                        widget.noneTriggerAction.displayRules?.remove(keyRule);
                        widget.noneTriggerAction.displayRules?[key] = value;
                      });
                    },
                    newValue: widget.noneTriggerAction.displayRules![keyRule]!,
                    oldValue: keyRule,
                  ),
                );
              },
              title: Text(
                widget.noneTriggerAction.displayRules![keyRule] ?? "Not Found",
              ),
              subtitle: Text(keyRule),
            ),
          ),
      ],
    );
  }
}

class _RuleAddEditAlertDialog extends StatelessWidget {
  final Function(String, String) onAdd;
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final String oldValue;
  final String newValue;
  _RuleAddEditAlertDialog({
    required this.onAdd,
    this.oldValue = "",
    this.newValue = "",
  }) {
    keyController.text = oldValue;
    valueController.text = newValue;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Rule"),
      actions: [
        TextButton(
          onPressed: () => {
            onAdd(keyController.text, valueController.text),
            Navigator.pop(context),
          },
          child: const Text("Save"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Old Value"),
            controller: keyController,
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              decoration: const InputDecoration(labelText: "New Value"),
              controller: valueController,
            ),
          ),
        ],
      ),
    );
  }
}
