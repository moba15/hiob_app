import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/triggerAction/multiselection_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class MultiSelectionTriggerActionSettings extends TriggerActionSetting {
  final MultiSelectionTriggerAction multiSelectionTriggerAction;
  final GlobalKey datapointKey = GlobalKey();
  final GlobalKey selectionsKey = GlobalKey();

  MultiSelectionTriggerActionSettings(
      {Key? key, required this.multiSelectionTriggerAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Showcase(
            key: datapointKey,
            title: "Datapoint",
            description: "The Datapoint which will be controlled by the Widget",
            child: InputFieldContainer.inputContainer(
              child: DeviceSelection(
                customWidgetManager: Manager.instance.customWidgetManager,
                onDataPointSelected: (d) =>
                    {multiSelectionTriggerAction.dataPoint = d},
                onDeviceSelected: (d) =>
                    {multiSelectionTriggerAction.dataPoint == null},
                selectedDataPoint: multiSelectionTriggerAction.dataPoint,
                selectedDevice: multiSelectionTriggerAction.dataPoint?.device,
              ),
            )),
        Showcase(
          key: selectionsKey,
          title: "Selection",
          description:
              "Here you can setup the different selection you want to be able to choose later, to control the Device",
          child: _SelectionSettings(
              multiSelectionTriggerAction: multiSelectionTriggerAction),
        )
      ],
    );
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      [datapointKey, selectionsKey];
}

class _SelectionSettings extends StatefulWidget {
  final MultiSelectionTriggerAction multiSelectionTriggerAction;

  const _SelectionSettings(
      {Key? key, required this.multiSelectionTriggerAction})
      : super(key: key);

  @override
  State<_SelectionSettings> createState() => _SelectionSettingsState();
}

class _SelectionSettingsState extends State<_SelectionSettings> {
  @override
  Widget build(BuildContext context) {
    final keys = widget.multiSelectionTriggerAction.selections.keys.toList();

    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(left: 10),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Selections: ",
            style: TextStyle(fontSize: 17),
          ),
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => _SelectionAddAlertDialog(
                          onAdd: (key, value) {
                            if (widget.multiSelectionTriggerAction.selections
                                .containsKey(key)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Selection already exists!")));
                            }
                            setState(() {
                              widget.multiSelectionTriggerAction
                                  .selections[key] = value;
                            });
                          },
                        ));
              },
              child: const Text("Add"))
        ],
      ),
      children: [
        ReorderableListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String selectionKey = keys.elementAt(index);
              return Dismissible(
                onDismissed: (d) {
                  setState(() {
                    widget.multiSelectionTriggerAction.selections
                        .remove(selectionKey);
                  });
                },
                key: ValueKey(selectionKey),
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
                  title: Text("View: $selectionKey"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (c) => _SelectionAddAlertDialog(
                              onAdd: (key, value) {
                                setState(() {
                                  widget.multiSelectionTriggerAction.selections
                                      .remove(selectionKey);
                                  widget.multiSelectionTriggerAction
                                      .selections[key] = value;
                                  widget.multiSelectionTriggerAction
                                      .reorderSelection(
                                          widget.multiSelectionTriggerAction
                                                  .selections.length -
                                              1,
                                          index);
                                });
                              },
                              newValue: widget.multiSelectionTriggerAction
                                  .selections[selectionKey]!,
                              oldValue: selectionKey,
                            ));
                  },
                  subtitle: Text(
                      "Value: ${widget.multiSelectionTriggerAction.selections[selectionKey]}"),
                ),
              );
            },
            itemCount:
                widget.multiSelectionTriggerAction.selections.keys.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                widget.multiSelectionTriggerAction
                    .reorderSelection(oldIndex, newIndex);
              });
            })
      ],
    );
  }
}

class _SelectionAddAlertDialog extends StatelessWidget {
  final Function(String, String) onAdd;
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final String oldValue, newValue;

  _SelectionAddAlertDialog(
      {Key? key, required this.onAdd, this.oldValue = "", this.newValue = ""})
      : super(key: key) {
    keyController.text = oldValue;
    valueController.text = newValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Selection"),
      actions: [
        TextButton(
            onPressed: () => {
                  onAdd(keyController.text, valueController.text),
                  Navigator.pop(context)
                },
            child: const Text("Save")),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Display value"),
            controller: keyController,
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              decoration: const InputDecoration(labelText: "Datapoint value"),
              controller: valueController,
            ),
          )
        ],
      ),
    );
  }
}
