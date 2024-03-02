//TODO: Better name

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/cutsom_group_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

class TemplateAdder extends StatefulWidget {
  final String title;
  final String name;
  final Widget? toggle;
  final bool Function() isSaved;
  final Function(String name) save;
  final Function(List<CustomWidgetTemplate>) addTemplates;
  final IconWrapper? currentIconWrapper;
  final Function(CustomWidgetTemplate) addLine;
  final Function(CustomGroupWidget) addGroup;
  final Function(int oldIndex, int newIndex) reorderTemplate;
  final Function(int index) removeTemplate;
  final Function(IconWrapper? newIconWrapper) iconDataChange;
  final ScreenManager screenManager;
  //!Change to call by refernce for better performance
  final List<dynamic> templates;
  const TemplateAdder({
    Key? key,
    required this.title,
    required this.name,
    required this.toggle,
    required this.isSaved,
    required this.save,
    required this.addGroup,
    required this.addLine,
    required this.addTemplates,
    required this.currentIconWrapper,
    required this.screenManager,
    required this.reorderTemplate,
    required this.removeTemplate,
    required this.templates,
    required this.iconDataChange,
  }) : super(key: key);

  @override
  State<TemplateAdder> createState() => _TemplateAdderState();
}

class _TemplateAdderState extends State<TemplateAdder> {
  TextEditingController nameController = TextEditingController();
  IconWrapper? currentIconWrapper;
  bool? enabled;

  @override
  void initState() {
    nameController.text = widget.name;
    currentIconWrapper = widget.currentIconWrapper;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  if (!_isSaved()) {
                    showDialog(
                        context: context,
                        builder: (_) => _SaveDialog(
                              onSave: () => {
                                _save(),
                                Navigator.popUntil(
                                    context, (route) => route.isFirst)
                              },
                              cancel: () => Navigator.popUntil(
                                  context, (route) => route.isFirst),
                            ));
                    return;
                  }
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.home)),
          ],
        ),
        floatingActionButton: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: addTemplate,
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 90),
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: "d",
                onPressed: addGroup,
                child: const Icon(Icons.group_add),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 149),
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: "dasd",
                onPressed: addLine,
                child: const Icon(Icons.splitscreen),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "tag",
                onPressed: () => {_save(), Navigator.pop(context)},
                child: const Icon(Icons.save),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10, bottom: 5),
                  child: IconPickerTemplate(
                    onChange: (IconWrapper? iconWrapper) {
                      widget.iconDataChange(iconWrapper);
                    },
                    selected: currentIconWrapper ?? const IconWrapper(),
                  )),
              if (widget.toggle != null) widget.toggle!,
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: BlocProvider(
                  create: (_) =>
                      ScreenListCubit(screenManager: widget.screenManager),
                  child: WidgetTemplateListPage(
                    screenManager: widget.screenManager,
                    widgetTemplates: widget.templates,
                    onReorder: widget.reorderTemplate,
                    removeTemplate: widget.removeTemplate,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        if (!_isSaved()) {
          showDialog(
              context: context,
              builder: (_) => _SaveDialog(
                    onSave: () => {_save(), Navigator.pop(context)},
                    cancel: () => Navigator.pop(context),
                  ));
          return false;
        }
        return true;
      },
    );
  }

  bool _isSaved() {
    return widget.isSaved();
  }

  void _save() {
    widget.save(nameController.text);
  }

  void addTemplate() {
    //widget.screen.addWidgetTemplate(widget.screenManager, CustomWidgetTemplate(id: "id", name: "name", customWidget: CustomTextWidget(name: "", text: CustomTextAttribute(data: ""))));
    showDialog(
        context: context,
        builder: (context) => _AddTemplateAlertDialog(
              screenManager: widget.screenManager,
              onAdd: (List<CustomWidgetTemplate> templates) {
                setState(() {
                  widget.addTemplates(templates);
                });
              },
            ));
  }

  //TODO In future: Use the Bloc pattern
  void addGroup() {
    showDialog(
        context: context,
        builder: (context) => AddGroupAlertDialog(
              onAdd: (CustomGroupWidget customGroupWidget) {
                setState(() {
                  widget.addGroup(customGroupWidget);
                });
              },
            ));
  }

  void addLine() {
    showDialog(
        context: context,
        builder: (context) => _AddDivisionLineTemplate(
              onAdd: (CustomDivisionLineWidget c) {
                setState(() {
                  widget.addLine(CustomWidgetTemplate(
                      id: Manager.instance.getRandString(12),
                      name: "Line",
                      customWidget: c));
                });
              },
            ));
  }
}

class _SaveDialog extends StatelessWidget {
  final Function onSave;
  final Function cancel;

  const _SaveDialog({Key? key, required this.onSave, required this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(getAppLocalizations(context).not_saved_alert_title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(getAppLocalizations(context).want_to_exit_alert),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => {Navigator.pop(context), cancel()},
            child: Text(getAppLocalizations(context).exit)),
        TextButton(
            onPressed: () => {Navigator.pop(context), onSave()},
            child: Text(getAppLocalizations(context).save)),
      ],
    );
  }
}

class _AddTemplateAlertDialog extends StatefulWidget {
  final ScreenManager screenManager;
  final Function(List<CustomWidgetTemplate>) onAdd;

  const _AddTemplateAlertDialog(
      {Key? key, required this.screenManager, required this.onAdd})
      : super(key: key);

  @override
  State<_AddTemplateAlertDialog> createState() =>
      _AddTemplateAlertDialogState();
}

class _AddTemplateAlertDialogState extends State<_AddTemplateAlertDialog> {
  List<CustomWidgetTemplate> selected = [];

  @override
  Widget build(BuildContext context) {
    List<CustomWidgetTemplate> templates =
        List.of(widget.screenManager.manager.customWidgetManager.templates);
    //!Remove
    // templates.removeWhere(
    //     (element) => widget.screen.widgetTemplates.contains(element));
    return AlertDialog(
      title:
          Text(getAppLocalizations(context).select_widget_template_alert_title),
      actions: [
        TextButton(
            onPressed: cancel,
            child: Text(getAppLocalizations(context).cancel)),
        TextButton(
            onPressed: add, child: Text(getAppLocalizations(context).add)),
      ],
      content: SizedBox(
        child: Column(
          children: [
            for (CustomWidgetType type in CustomWidgetType.values
                .where((element) => element != CustomWidgetType.group))
              if (templates.any((element) => element.customWidget.type == type))
                ExpansionTile(
                  title: Text(
                      "${type.name} (${templates.where((element) => element.customWidget.type == type).length})"),
                  children: [
                    for (CustomWidgetTemplate t in templates
                        .where((element) => element.customWidget.type == type))
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
    widget.onAdd(selected);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}

class AddGroupAlertDialog extends StatefulWidget {
  final Function(CustomGroupWidget) onAdd;

  const AddGroupAlertDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<AddGroupAlertDialog> createState() => _AddGroupAlertDialogState();
}

class _AddGroupAlertDialogState extends State<AddGroupAlertDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(getAppLocalizations(context).add_group_alert_title),
        actions: [
          TextButton(
              onPressed: cancel,
              child: Text(getAppLocalizations(context).cancel)),
          TextButton(
              onPressed: add, child: Text(getAppLocalizations(context).add)),
        ],
        content: TextField(
          controller: _nameController,
          decoration: InputDecoration(
              labelText: getAppLocalizations(context).group_name),
        ));
  }

  void add() {
    widget.onAdd(CustomGroupWidget(name: _nameController.text));
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}

class WidgetTemplateListPage extends StatelessWidget {
  final ScreenManager screenManager;
  final List<dynamic> widgetTemplates;
  final Function(int oldIndex, int newIndex) onReorder;
  final Function(int index) removeTemplate;

  const WidgetTemplateListPage(
      {Key? key,
      required this.screenManager,
      required this.widgetTemplates,
      required this.onReorder,
      required this.removeTemplate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
        itemCount: widgetTemplates.length,
        onReorder: (int oldIndex, int newIndex) {
          onReorder(oldIndex, newIndex);
        },
        itemBuilder: (BuildContext context, int index) {
          if (widgetTemplates.length > index &&
              widgetTemplates[index] is CustomWidgetTemplate) {
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
                onDismissed: (d) => removeTemplate(index),
                key: ValueKey(widgetTemplates[index]),
                child: CustomWidgetTemplateTile(
                  customWidget: widgetTemplates[index],
                  customWidgetManager:
                      screenManager.manager.customWidgetManager,
                ));
          } else if (widgetTemplates.length > index &&
              widgetTemplates[index] is CustomGroupWidget) {
            return Dismissible(
              key: ValueKey(widgetTemplates[index]),
              onDismissed: (d) => removeTemplate(index),
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
              child: CustomGroupWidgetTile(
                  customGroupWidget: widgetTemplates[index]),
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
                removeTemplate(index);
              },
              key: ValueKey(widgetTemplates[index]),
              child: ListTile(
                title: const Text("Line"),
                subtitle: Text(
                    "Thickness: ${(widgetTemplates[index] as CustomDivisionLineWidget).thickness}"),
              ),
            );
          }
        });
  }
}

class _AddDivisionLineTemplate extends StatelessWidget {
  final Function(CustomDivisionLineWidget) onAdd;
  int thickness = 2;

  _AddDivisionLineTemplate({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(getAppLocalizations(context).add_divider_alert_title),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(getAppLocalizations(context).cancel),
        ),
        TextButton(
          onPressed: () {
            onAdd(CustomDivisionLineWidget(
                thickness: thickness,
                name: 'Line (t: ' + thickness.toString() + ")"));
          },
          child: Text(getAppLocalizations(context).add),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(getAppLocalizations(context).thickness),
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
