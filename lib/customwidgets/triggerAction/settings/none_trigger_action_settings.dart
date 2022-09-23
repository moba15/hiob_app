import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/triggerAction/none_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';

class NoneTriggerActionSettings extends TriggerActionSetting {
  final NoneTriggerAction noneTriggerAction;
  final GlobalKey dataPointKey = GlobalKey();
  final GlobalKey roundToKey = GlobalKey();
  final GlobalKey unitKey = GlobalKey();
  final GlobalKey textRulesKey = GlobalKey();
  NoneTriggerActionSettings({Key? key, required this.noneTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build:" + roundToKey.toString());
    return Column(
      children: [
        Showcase(
          key: dataPointKey,
          title: "Datapoint",
          description: "The Datapoint which value will be shown",
          child: DeviceSelection(
            customWidgetManager: Manager.instance!.customWidgetManager,
            onDataPointSelected: (d) => {noneTriggerAction.dataPoint =d},
            onDeviceSelected: (d)=> {noneTriggerAction.dataPoint == null},
            selectedDataPoint: noneTriggerAction.dataPoint,
            selectedDevice: noneTriggerAction.dataPoint?.device,
          ),
        ),
        Showcase(
          key: roundToKey,
          title: "Round",
          description: "If the value of the datapoint is a number it will be round to x decimals",
          child: TextField(
            controller: TextEditingController.fromValue(TextEditingValue(text: noneTriggerAction.round.toString())),
            decoration: const InputDecoration(labelText: "Round to"),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (v) => noneTriggerAction.round = int.tryParse(v) ?? 2,
          ),
        ),
        Showcase(
          key: unitKey,
          title: "Unit",
          description: "If set this will be written behind the actual value of the datapoint",
          child: TextField(
              controller: TextEditingController.fromValue(TextEditingValue(text: noneTriggerAction.unit ?? "")),
              decoration: const InputDecoration(labelText: "Unit (optional)"),
              maxLength: 10,
              onChanged: (v) => {noneTriggerAction.unit = v, if(v.isEmpty) noneTriggerAction.unit = null}
          ),
        ),
        Showcase(
          key: textRulesKey,
          title: "Text Rules",
          description: "Here you can map one value to an other",
          child: _RulesSettings(noneTriggerAction: noneTriggerAction),
        )
      ],
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [dataPointKey, roundToKey, unitKey, textRulesKey];

}

class _RulesSettings extends StatefulWidget {
  final NoneTriggerAction noneTriggerAction;
  const _RulesSettings({Key? key, required this.noneTriggerAction}) : super(key: key);

  @override
  State<_RulesSettings> createState() => _RulesSettingsState();
}

class _RulesSettingsState extends State<_RulesSettings> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(left: 10),

      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Text Rules: ", style: TextStyle(fontSize: 17),),
          TextButton(onPressed: ()  {
            showDialog(context: context, builder: (context) =>
                _RuleAddAlertDialog(onAdd: (key,value )  {
                  if(widget.noneTriggerAction.displayRules?.containsKey(key) ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Rule Already exists!")));
                  }
                  setState(() {
                    widget.noneTriggerAction.displayRules ??= {};
                    widget.noneTriggerAction.displayRules?[key] = value;
                  });
                },));
          }, child: const Text("Add"))
        ],
      ),
      children: [
        for(String keyRule in widget.noneTriggerAction.displayRules?.keys ?? [] )
          Dismissible(
            onDismissed: (d) {
              setState(() {
                widget.noneTriggerAction.displayRules?.remove(keyRule);
              });
            },
            key: ValueKey(keyRule),
            child: ListTile(
              title: Text(widget.noneTriggerAction.displayRules![keyRule] ?? "Not Found"),
              subtitle: Text(keyRule),


            ),
            background: Container(
              color: Colors.red,
              child: Container(
                child: const Icon(Icons.delete_forever),
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              ),
              alignment: Alignment.centerLeft,
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: Container(
                child: const Icon(Icons.delete_forever),
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              ),
              alignment: Alignment.centerRight,
            ),
            direction: DismissDirection.endToStart,
          )
      ],

    );
  }
}

class _RuleAddAlertDialog extends StatelessWidget {
  final Function(String, String) onAdd;
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  _RuleAddAlertDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Rule"),
      actions: [
        TextButton(onPressed: () => {onAdd(keyController.text, valueController.text)}, child: const Text("Add")),
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel"))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Old Value"),
            controller: keyController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "New Value"),
            controller: valueController,
          ),
          DropdownButtonFormField<int>(
            items: const [],
            onChanged: (int? value) {  },

          )

        ],
      ),
    );
  }
}

