// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/cutsom_group_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import '../../../../customwidgets/custom_widget.dart';
import '../../../../customwidgets/widgets/custom_divisionline_widget.dart';

class ScreenEditPage extends StatefulWidget {
  final Screen screen;
  final ScreenManager screenManager;

  const ScreenEditPage(
      {Key? key, required this.screen, required this.screenManager})
      : super(key: key);

  @override
  State<ScreenEditPage> createState() => _ScreenEditPageState();
}

class _ScreenEditPageState extends State<ScreenEditPage> {
  TextEditingController nameController = TextEditingController();
  IconData? currentIconData;
  bool? enabled;

  late Screen screen;

  @override
  void initState() {
    enabled = widget.screen.enabled;
    screen = widget.screen.clone();
    nameController.text = screen.name;
    currentIconData = IconData(int.parse(screen.iconID, radix: 16));
    super.initState();
  }

  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Screen"),
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
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 5),
                  child: IconPickerTemplate(
                    onChange: (IconData? iconData) {
                      currentIconData = iconData;
                    },
                    selected: currentIconData ?? Icons.home,
                  )),
              CheckboxListTile(
                onChanged: (value) {
                  setState(() {
                    enabled = value ?? true;
                  });
                },
                value: enabled ?? true,
                title: Text(AppLocalizations.of(context)!.enabled),
                secondary: enabled == true || enabled == null
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: BlocProvider(
                  create: (_) =>
                      ScreenListCubit(screenManager: widget.screenManager),
                  child: ScreenWidgetTemplateListPage(
                      screen: screen, screenManager: widget.screenManager),
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
    return jsonEncode(screen.toJson()) == jsonEncode(widget.screen.toJson());
  }

  void _save() {
    widget.screen.widgetTemplates = screen.widgetTemplates;
    widget.screenManager.editScreen(
        screen: widget.screen,
        name: nameController.text,
        iconID: currentIconData?.codePoint.toRadixString(16) ?? "ee98",
        index: 1,
        enabled: enabled ?? true);
  }

  void addTemplate() {
    //widget.screen.addWidgetTemplate(widget.screenManager, CustomWidgetTemplate(id: "id", name: "name", customWidget: CustomTextWidget(name: "", text: CustomTextAttribute(data: ""))));
    showDialog(
        context: context,
        builder: (context) => _AddTemplateAlertDialog(
              screen: screen,
              screenManager: widget.screenManager,
            ));
  }

  void addGroup() {
    showDialog(
        context: context,
        builder: (context) => AddGroupAlertDialog(
              screen: screen,
              screenManager: widget.screenManager,
            ));
  }

  void addLine() {
    showDialog(
        context: context,
        builder: (context) => _AddDivisionLineTemplate(
              onAdd: (CustomDivisionLineWidget c) {
                setState(() {
                  screen.addWidgetTemplate(
                      widget.screenManager,
                      CustomWidgetTemplate(
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
  final Screen screen;
  final ScreenManager screenManager;

  const _AddTemplateAlertDialog(
      {Key? key, required this.screen, required this.screenManager})
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
    templates.removeWhere(
        (element) => widget.screen.widgetTemplates.contains(element));
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.select_widget_template_alert_title),
      actions: [
        TextButton(onPressed: cancel, child: Text(getAppLocalizations(context).cancel)),
        TextButton(onPressed: add, child: Text(getAppLocalizations(context).add)),
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
    widget.screen.addWidgetTemplates(widget.screenManager, selected);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}

class AddGroupAlertDialog extends StatefulWidget {
  final Screen screen;
  final ScreenManager screenManager;

  const AddGroupAlertDialog(
      {Key? key, required this.screen, required this.screenManager})
      : super(key: key);

  @override
  State<AddGroupAlertDialog> createState() => _AddGroupAlertDialogState();
}

class _AddGroupAlertDialogState extends State<AddGroupAlertDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title:  Text(getAppLocalizations(context).add_group_alert_title),
        actions: [
          TextButton(onPressed: cancel, child: Text(getAppLocalizations(context).cancel)),
          TextButton(onPressed: add, child: Text(getAppLocalizations(context).add)),
        ],
        content: TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: getAppLocalizations(context).group_name),
        ));
  }

  void add() {
    widget.screen.addGroup(
        CustomGroupWidget(name: _nameController.text), widget.screenManager);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}

class ScreenWidgetTemplateListPage extends StatelessWidget {
  final Screen screen;
  final ScreenManager screenManager;

  const ScreenWidgetTemplateListPage(
      {Key? key, required this.screen, required this.screenManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<dynamic> templates = screen.widgetTemplates;

    return ReorderableListView.builder(
        itemCount: templates.length,
        onReorder: (int oldIndex, int newIndex) {
          screen.reorderWidgetTemplates(
              oldIndex: oldIndex,
              newIndex: newIndex,
              screenManager: screenManager);
        },
        itemBuilder: (BuildContext context, int index) {
          if (templates.length > index &&
              templates[index] is CustomWidgetTemplate) {
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
                onDismissed: (d) => screen.removeWidgetTemplate(
                    screenManager, templates[index]),
                key: ValueKey(templates[index]),
                child: CustomWidgetTemplateTile(
                  customWidget: templates[index],
                  customWidgetManager:
                      screenManager.manager.customWidgetManager,
                ));
          } else {
            return Dismissible(
              key: ValueKey(templates[index]),
              onDismissed: (d) =>
                  screen.removeWidgetTemplate(screenManager, templates[index]),
              child: CustomGroupWidgetTile(customGroupWidget: templates[index]),
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
      title:  Text(getAppLocalizations(context).add_divider_alert_title),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:  Text(getAppLocalizations(context).cancel),
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
