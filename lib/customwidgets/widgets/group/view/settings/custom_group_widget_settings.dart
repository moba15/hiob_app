// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';
import 'package:smart_home/settings/general_settings/view/template_adder.dart';

class CustomGroupWidgetSettingsPage extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;

  late CustomGroupWidget clone;
  CustomGroupWidgetSettingsPage({super.key, required this.customGroupWidget}) {
    clone = customGroupWidget.clone();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateAdder(
      title: getAppLocalizations(context).group_edit_page_title,
      name: clone.name ?? "",
      toggle: toggleWidget(context),
      isSaved: _isSaved,
      save: _save,
      addGroup: _addGroup,
      addLine: _addLine,
      addTemplates: _addTemplates,
      screenManager: Manager.instance.screenManager,
      reorderTemplate: _reorderTemplate,
      removeTemplate: _removeTemplate,
      templates: clone.templates,
      currentIconWrapper: clone.iconWrapper,
      iconDataChange: _iconChange,
    );
    // return WillPopScope(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Edit Group"),
    //       actions: [
    //         IconButton(
    //             onPressed: () {
    //               if (!_saved(clone)) {
    //                 showDialog(
    //                     context: context,
    //                     builder: (_) => _SaveDialog(
    //                           onSave: () => {
    //                             save(context, clone),
    //                             Navigator.popUntil(
    //                                 context, (route) => route.isFirst)
    //                           },
    //                           cancel: () => Navigator.popUntil(
    //                               context, (route) => route.isFirst),
    //                         ));
    //                 return;
    //               }
    //               Navigator.popUntil(context, (route) => route.isFirst);
    //             },
    //             icon: const Icon(Icons.home)),
    //       ],
    //     ),
    //     floatingActionButton: Stack(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(left: 31),
    //           child: Align(
    //             alignment: Alignment.bottomLeft,
    //             child: FloatingActionButton(
    //               onPressed: () {
    //                 showDialog(
    //                     context: context,
    //                     builder: (context) => AddTemplateAlertDialog(
    //                           customGroupWidget: clone,
    //                           onAdded: (template) =>
    //                               {_addedController.add(template)},
    //                           screenManager: Manager.instance.screenManager,
    //                         ));
    //               },
    //               child: const Icon(Icons.add),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.only(left: 90),
    //           alignment: Alignment.bottomLeft,
    //           child: FloatingActionButton(
    //             heroTag: "d",
    //             onPressed: () {
    //               showDialog(
    //                   context: context,
    //                   builder: (context) => _AddDivisionLineTemplate(
    //                         onAdd: (widget) => {
    //                           {_addedController.add(widget)},
    //                         },
    //                       ));
    //             },
    //             child: const Icon(Icons.splitscreen),
    //           ),
    //         ),
    //         Align(
    //           alignment: Alignment.bottomRight,
    //           child: FloatingActionButton(
    //             heroTag: "tag",
    //             onPressed: () => {
    //               if (customGroupWidgetSettings.validate())
    //                 {save(context, clone), Navigator.pop(context)}
    //             },
    //             child: const Icon(Icons.save),
    //           ),
    //         ),
    //       ],
    //     ),
    //     body: Container(
    //       margin: const EdgeInsets.only(left: 20, right: 20),
    //       child: customGroupWidgetSettings,
    //     ),
    //   ),
    //   onWillPop: () async {
    //     if (!_saved(clone)) {
    //       showDialog(
    //           context: context,
    //           builder: (_) => _SaveDialog(
    //               onSave: () => {save(context, clone), Navigator.pop(context)},
    //               cancel: () => Navigator.pop(context)));
    //       return false;
    //     }
    //     return true;
    //   },
    // );
  }

  Widget toggleWidget(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return CheckboxListTile(
          onChanged: (value) {
            setState(() {
              clone.isExtended = value ?? true;
            });
          },
          value: clone.isExtended,
          title: Text(getAppLocalizations(context).expanded),
          secondary: const Icon(Icons.expand),
        );
      },
    );
  }

  bool _isSaved() {
    if (jsonEncode(clone.toJson()) != jsonEncode(customGroupWidget.toJson())) {
      return false;
    }
    return true;
  }

  void _save(String name) {
    customGroupWidget.name = name;
    customGroupWidget.templates = clone.templates;
    customGroupWidget.isExtended = clone.isExtended;
    customGroupWidget.iconWrapper = clone.iconWrapper;
    Manager.instance.screenManager.update();
  }

  void _addTemplates(List<CustomWidgetWrapper> templates) {
    clone.addTemplates(templates);
  }

  void _addGroup(CustomGroupWidget customGroupWidget) {
    clone.addGroup(customGroupWidget);
  }

  void _addLine(CustomWidgetTemplate line) {
    clone.addTemplates([line]);
  }

  void _reorderTemplate(int oldIndex, int newIndex) {
    clone.reorder(oldIndex: oldIndex, newIndex: newIndex);
  }

  void _removeTemplate(int index) {
    clone.removeTemplateAtIndex(index);
  }

  void _iconChange(IconWrapper? iconWrapper) {
    clone.iconWrapper = iconWrapper;
  }
}

class CustomGroupWidgetSettings extends CustomWidgetSettingStatefulWidget {
  final CustomGroupWidget customGroupWidget;
  final Stream stream;
  const CustomGroupWidgetSettings(
      {super.key, required this.customGroupWidget, required this.stream});

  @override
  State<CustomGroupWidgetSettings> createState() =>
      _CustomGroupWidgetSettingsState();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated => customGroupWidget;
  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  bool validate() {
    return customGroupWidget.name != null && customGroupWidget.name!.isNotEmpty;
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  // TODO: implement deprecated
  bool get deprecated => true;
}

class _CustomGroupWidgetSettingsState extends State<CustomGroupWidgetSettings> {
  final TextEditingController _nameController = TextEditingController();
  StreamSubscription? _streamSub;
  @override
  void initState() {
    _nameController.text = widget.customGroupWidget.name ?? "";
    _streamSub = widget.stream.listen((event) {
      setState(() {
        if (event is List<dynamic>) {
          List<dynamic> e = event;
          widget.customGroupWidget
              .addTemplates(List<CustomWidgetTemplate>.from(e));
        } else {
          // widget.customGroupWidget.addLine(event);
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
    return Column(
      children: [
        TextField(
          onChanged: (v) => widget.customGroupWidget.name = v,
          controller: _nameController,
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(labelText: "Group Name"),
        ),
        Container(
          height: 15,
        ),
        IconPickerTemplate(
            onChange: (d) => {
                  if (d == null) widget.customGroupWidget.iconWrapper == null,
                  if (d != null) widget.customGroupWidget.iconWrapper = d
                },
            reset: true,
            selected:
                widget.customGroupWidget.iconWrapper ?? const IconWrapper()),
        Row(
          children: [
            const Text(
              "Expanded: ",
              style: TextStyle(fontSize: 17),
            ),
            Checkbox(
              visualDensity: VisualDensity.compact,
              onChanged: (v) {
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
            const Text(
              "Templates:",
              style: TextStyle(fontSize: 17),
            ),
            Container(
              width: 16,
            ),
          ],
        ),
        Expanded(
          child: ReorderableListView.builder(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                widget.customGroupWidget
                    .reorder(oldIndex: oldIndex, newIndex: newIndex);
              });
            },
            itemCount: widget.customGroupWidget.templates.length,
            itemBuilder: (BuildContext context, int index) {
              if (widget.customGroupWidget.templates[index]
                  is CustomWidgetTemplate) {
                return Dismissible(
                  onDismissed: (d) {
                    setState(() {
                      widget.customGroupWidget.removeTemplate(
                          widget.customGroupWidget.templates[index]);
                    });
                  },
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
                  key: ValueKey(widget.customGroupWidget.templates[index].id),
                  child: CustomWidgetTemplateTile(
                      toggleSelect: () => {},
                      customWidget: widget.customGroupWidget.templates[index],
                      customWidgetManager:
                          Manager.instance.customWidgetManager),
                );
              } else {
                return Dismissible(
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
                  onDismissed: (d) {
                    setState(() {
                      widget.customGroupWidget.removeTemplate(
                          widget.customGroupWidget.templates[index]);
                    });
                  },
                  key: ValueKey(widget.customGroupWidget.templates[index]),
                  child: ListTile(
                    title: const Text("Line"),
                    subtitle: Text(
                        "Thickness: ${(widget.customGroupWidget.templates[index] as CustomDivisionLineWidget).thickness}"),
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
  final Function(List<CustomWidgetWrapper>) onAdded;
  const AddTemplateAlertDialog(
      {super.key,
      required this.customGroupWidget,
      required this.screenManager,
      required this.onAdded});

  @override
  State<AddTemplateAlertDialog> createState() => _AddTemplateAlertDialogState();
}

class _AddTemplateAlertDialogState extends State<AddTemplateAlertDialog> {
  List<CustomWidgetWrapper> selected = [];

  @override
  Widget build(BuildContext context) {
    List<CustomWidgetWrapper> templates =
        List.of(widget.screenManager.manager.customWidgetManager.templates);
    templates.removeWhere(
        (element) => widget.customGroupWidget.templates.contains(element));
    return AlertDialog(
      title: const Text("Select Widget Template"),
      actions: [
        TextButton(onPressed: cancel, child: const Text("Cancel")),
        TextButton(onPressed: add, child: const Text("Add")),
      ],
      content: SizedBox(
        child: Column(
          children: [
            for (CustomWidgetTypeDeprecated type
                in CustomWidgetTypeDeprecated.values.where((element) =>
                    element.name != CustomWidgetTypeDeprecated.group.name))
              if (templates.any((element) => element.type?.name == type.name))
                ExpansionTile(
                  title: Text(
                      "${type.name} (${templates.where((element) => element.type?.name == type.name).length})"),
                  children: [
                    for (CustomWidgetWrapper t in templates
                        .where((element) => element.type?.name == type.name))
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
                        subtitle: Text(t.type?.name ?? "Error"),
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
  _AddDivisionLineTemplate({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Divider"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onAdd(CustomDivisionLineWidget(
                thickness: thickness,
                name: "Line (t: ${thickness.toString()}  )"));
          },
          child: const Text("Add"),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Thickness"),
          StatefulBuilder(
            builder: (context, setState) {
              int value = thickness;
              return Slider(
                onChanged: (v) {
                  setState(() {
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

class _SaveDialog extends StatelessWidget {
  final Function onSave;
  final Function cancel;
  const _SaveDialog({required this.onSave, required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Changes not saved"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Do you want exit without exit!"),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => {Navigator.pop(context), cancel()},
            child: const Text("Exit")),
        TextButton(
            onPressed: () => {Navigator.pop(context), onSave()},
            child: const Text("Save")),
      ],
    );
  }
}
