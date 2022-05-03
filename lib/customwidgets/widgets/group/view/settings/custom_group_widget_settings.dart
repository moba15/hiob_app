import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';

class CustomGroupWidgetSettingsPage extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;
  final StreamController<dynamic> _addedController = StreamController.broadcast();
  CustomGroupWidgetSettingsPage({Key? key, required this.customGroupWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomGroupWidget clone = customGroupWidget.clone();
    CustomGroupWidgetSettings customGroupWidgetSettings = CustomGroupWidgetSettings(customGroupWidget: clone, stream: _addedController.stream,);
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Edit Group"),

          ),
          floatingActionButton: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) =>
                          AddTemplateAlertDialog(
                            customGroupWidget: clone,
                            onAdded: (template) => {_addedController.add(template)},
                            screenManager: Manager.instance!.screenManager,));
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 90),
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  heroTag: "d",
                  onPressed: ()  {
                    showDialog(context: context, builder: (context) => _AddDivisionLineTemplate(onAdd: (widget) => {
                      {_addedController.add(widget)},


                    },));
                  },
                  child: const Icon(Icons.splitscreen),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "tag",
                  onPressed: () => {
                    if(customGroupWidgetSettings.validate())
                      save(context, clone)
                  },
                  child: const Icon(Icons.save),
                ),
              ),

            ],
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: customGroupWidgetSettings,
          )
      ),
      onWillPop: () async {
        return true;
      },
    );
  }

  void save(BuildContext context, CustomGroupWidget clone) {
    customGroupWidget.name = clone.name;
    customGroupWidget.templates = clone.templates;
    customGroupWidget.isExtended = clone.isExtended;
    customGroupWidget.iconID = clone.iconID;
    Manager.instance!.screenManager.update();
    Navigator.pop(context);
  }
}


class CustomGroupWidgetSettings extends CustomWidgetSettingStatefulWidget {
  final CustomGroupWidget customGroupWidget;
  final Stream stream;
  const CustomGroupWidgetSettings({Key? key, required this.customGroupWidget, required this.stream}) : super(key: key);

  @override
  State<CustomGroupWidgetSettings> createState() => _CustomGroupWidgetSettingsState();

  @override
  CustomWidget get customWidget => customGroupWidget;

  @override
  bool validate() {
    return customGroupWidget.name != null && customGroupWidget.name!.isNotEmpty;
  }


}

class _CustomGroupWidgetSettingsState extends State<CustomGroupWidgetSettings> {
  final TextEditingController _nameController = TextEditingController();
  StreamSubscription? _streamSub;
  @override
  void initState() {
    _nameController.text = widget.customGroupWidget.name ?? "";
    _streamSub = widget.stream.listen((event) {
      setState(() {
        if(event is List<dynamic>) {
          List<dynamic> e = event;
          widget.customGroupWidget.addTemplates(
              List<CustomWidgetTemplate>.from(e));
        } else {
          widget.customGroupWidget.addLine(event);
        }

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          onChanged: (v) => widget.customGroupWidget.name = v,
          controller: _nameController,
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(labelText: "Group Name"),
        ),

        Container(height: 15,),
        IconPickerTemplate(
          onChange: (d) => {
            if(d==null)
              widget.customGroupWidget.iconID == null,
            if(d!=null)
              widget.customGroupWidget.iconID = d.codePoint.toRadixString(16),
          },
          reset: true,
          selected: widget.customGroupWidget.iconID != null ? IconData(int.tryParse(widget.customGroupWidget.iconID!, radix: 16) ?? 0) : Icons.home,
        ),
        Row(
          children: [
            const Text("Expanded: ", style: TextStyle(fontSize: 17),),
            Checkbox(
              visualDensity: VisualDensity.compact,
              onChanged: (v)  {
                setState(() {
                  widget.customGroupWidget.isExtended = v ?? false;
                });
              },
              value: widget.customGroupWidget.isExtended,
            )
          ],
        ),
       Row(
         children: [
           const Text("Templates:", style: TextStyle(fontSize: 17),),
           Container(width: 16,),

         ],
       ),
        Expanded(
          child: ReorderableListView.builder(

            onReorder: (oldIndex, newIndex)  {
              setState(() {
                widget.customGroupWidget.reorder(oldIndex: oldIndex, newIndex: newIndex);
              });

            },
            itemCount: widget.customGroupWidget.templates.length,
            itemBuilder: (BuildContext context, int index) {
              if(widget.customGroupWidget.templates[index] is CustomWidgetTemplate) {
                return Dismissible(
                  child: CustomWidgetTemplateTile(
                      customWidget: widget.customGroupWidget.templates[index],
                      customWidgetManager: Manager.instance!
                          .customWidgetManager),
                  onDismissed: (d) {
                    setState(() {
                      widget.customGroupWidget.removeTemplate(widget
                          .customGroupWidget.templates[index]);
                    });
                  },
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
                  key: ValueKey(widget.customGroupWidget.templates[index].id),
                );
              } else {
                return  Dismissible(
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
                  onDismissed: (d) {
                    setState(() {
                      widget.customGroupWidget.removeTemplate(widget
                          .customGroupWidget.templates[index]);
                    });
                  },
                  key: ValueKey(widget.customGroupWidget.templates[index]),
                  child: ListTile(
                    title: const Text("Line"),
                    subtitle: Text("Thickness: " + (widget.customGroupWidget.templates[index] as CustomDivisionLineWidget).thickness.toString()),
                  ),
                );
              }
            },
          ),
        ),




      ],
    );
  }
}



class AddTemplateAlertDialog extends StatefulWidget {
  final CustomGroupWidget customGroupWidget;
  final ScreenManager screenManager;
  final Function(List<CustomWidgetTemplate>)  onAdded;
  const AddTemplateAlertDialog(
      {Key? key, required this.customGroupWidget, required this.screenManager, required this.onAdded})
      : super(key: key);

  @override
  State<AddTemplateAlertDialog> createState() => _AddTemplateAlertDialogState();
}

class _AddTemplateAlertDialogState extends State<AddTemplateAlertDialog> {
  List<CustomWidgetTemplate> selected = [];

  @override
  Widget build(BuildContext context) {
    List<CustomWidgetTemplate> templates =
    List.of(widget.screenManager.manager.customWidgetManager.templates);
    templates.removeWhere((element) => widget.customGroupWidget.templates.contains(element));
    return AlertDialog(
      title: const Text("Select Widget Template"),
      actions: [
        TextButton(onPressed: cancel, child: const Text("Cancel")),
        TextButton(onPressed: add, child: const Text("Add")),
      ],
      content: SizedBox(
        child: Column(
          children: [
            for(CustomWidgetType type in CustomWidgetType.values.where((element) => element != CustomWidgetType.group))

              if(templates.any((element) => element.customWidget.type == type))
                ExpansionTile(
                  title: Text(type.name + " (" + templates.where((element) => element.customWidget.type == type).length.toString() + ")"),
                  children: [
                    for(CustomWidgetTemplate t in templates.where((element) => element.customWidget.type == type))
                      ListTile(
                        selected: selected.contains(t),
                        leading: Checkbox(
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selected.add(t);
                              } else {
                                selected.remove(t);
                              }
                            });
                          },
                          value: selected.contains(t),
                        ),
                        title: Text(t.name),
                        subtitle: Text(t.customWidget.type?.name ?? "Error"),
                      )
                  ],
                ),
          ],
        ),
      ),
      scrollable: true,
    );
  }

  void add() {
    widget.onAdded(selected);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}

class _AddDivisionLineTemplate extends StatelessWidget {
  final Function(CustomDivisionLineWidget) onAdd;
  int thickness = 2;
  _AddDivisionLineTemplate({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Divider"),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel"),),
        TextButton(onPressed: () {
          onAdd(CustomDivisionLineWidget(thickness: thickness, name: 'Line (t: ' + thickness.toString() + ")"));
        }, child: const Text("Add"),)
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Thickness"),
          StatefulBuilder(
            builder: (context, setState) {
              int value = thickness;
              return Slider(
                onChanged: (v)  {
                  setState(()  {
                    value = v.round();
                    thickness = v.round();
                  });
                },
                max: 10,
                min: 1,
                label: value.toString(),
                divisions: 10,
                value: value.toDouble(),
              );
            },
          )
        ],
      ),
    );
  }
}



