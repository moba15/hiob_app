import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/multiselection_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';

class MultiSelectionTriggerActionSettings extends TriggerActionSetting {
  final MultiSelectionTriggerAction multiSelectionTriggerAction;
  const MultiSelectionTriggerActionSettings({Key? key, required this.multiSelectionTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeviceSelection(
          customWidgetManager: Manager.instance!.customWidgetManager,
          onDataPointSelected: (d) => {multiSelectionTriggerAction.dataPoint =d},
          onDeviceSelected: (d)=> {multiSelectionTriggerAction.dataPoint == null},
          selectedDataPoint: multiSelectionTriggerAction.dataPoint,
          selectedDevice: multiSelectionTriggerAction.dataPoint?.device,
        ),


        _SelectionSettings(multiSelectionTriggerAction: multiSelectionTriggerAction),
      ],
    );
  }

}

class _SelectionSettings extends StatefulWidget {
  final MultiSelectionTriggerAction multiSelectionTriggerAction;
  const _SelectionSettings({Key? key, required this.multiSelectionTriggerAction}) : super(key: key);

  @override
  State<_SelectionSettings> createState() => _SelectionSettingsState();
}

class _SelectionSettingsState extends State<_SelectionSettings> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(left: 10),

      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Selections: ", style: TextStyle(fontSize: 17),),
          TextButton(onPressed: ()  {
            showDialog(context: context, builder: (context) =>
                _SelectionAddAlertDialog(onAdd: (key,value )  {
                  if(widget.multiSelectionTriggerAction.selections.containsKey(key)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Selection already exists!")));
                  }
                  setState(() {

                    widget.multiSelectionTriggerAction.selections[key] = value;
                  });
                },));
          }, child: const Text("Add"))
        ],
      ),
      children: [
        ReorderableListView.builder(
            physics : const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String selectionKey = widget.multiSelectionTriggerAction.selections.keys.elementAt(index);
              return Dismissible(
                onDismissed: (d) {
                  setState(() {
                    widget.multiSelectionTriggerAction.selections.remove(selectionKey);
                  });
                },
                key: ValueKey(selectionKey),
                child: ListTile(
                  title: Text("View: " + selectionKey),
                  subtitle: Text("Value: " + widget.multiSelectionTriggerAction.selections[selectionKey].toString()),


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
              );
            },
            itemCount: widget.multiSelectionTriggerAction.selections.keys.length,
            onReorder: (oldIndex, newIndex)  {
              setState(() {
                widget.multiSelectionTriggerAction.reorderSelection(oldIndex, newIndex  );
              });
            }
        )
      ],

    );
  }
}

class _SelectionAddAlertDialog extends StatelessWidget {
  final Function(String, String) onAdd;
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  _SelectionAddAlertDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new Selection"),
      actions: [
        TextButton(onPressed: () => {onAdd(keyController.text, valueController.text), Navigator.pop(context)}, child: const Text("Add")),
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel"))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Display value"),
            controller: keyController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Datapoint value"),
            controller: valueController,
          ),

        ],
      ),
    );
  }
}

