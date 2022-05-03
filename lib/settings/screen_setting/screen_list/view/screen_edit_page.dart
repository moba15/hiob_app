import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/cutsom_group_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';

import '../../../../customwidgets/custom_widget.dart';

class ScreenEditPage extends StatefulWidget {
  final Screen screen;
  final ScreenManager screenManager;

  const ScreenEditPage(
      {Key? key, required this.screen, required this.screenManager})
      : super(key: key);

  @override
  State<ScreenEditPage> createState() => _ScreenEditPageState(screen: screen);
}

class _ScreenEditPageState extends State<ScreenEditPage> {
  TextEditingController nameController = TextEditingController();
  IconData? currentIconData;

  _ScreenEditPageState({required Screen screen}) {
    nameController.text = screen.name;
    currentIconData = IconData(int.parse(screen.iconID, radix: 16));
  }

  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),
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
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: "tag",
              onPressed: save,
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
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: IconPickerTemplate(
                onChange: (IconData? iconData) {
                  currentIconData = iconData;
                },
                selected: currentIconData ?? Icons.home,
                
              )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: BlocProvider(
                    create: (_) => ScreenListCubit(screenManager: widget.screenManager),
                    child: ScreenWidgetTemplateListPage(screen: widget.screen, screenManager: widget.screenManager),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void save() {
    widget.screenManager.editScreen(
        screen: widget.screen,
        name: nameController.text,
        iconID: currentIconData?.codePoint.toRadixString(16) ?? "ee98",
        index: 1);
    Navigator.pop(context);
  }

  void addTemplate() {
    //widget.screen.addWidgetTemplate(widget.screenManager, CustomWidgetTemplate(id: "id", name: "name", customWidget: CustomTextWidget(name: "", text: CustomTextAttribute(data: ""))));
    showDialog(
        context: context,
        builder: (context) => AddTemplateAlertDialog(
          screen: widget.screen,
          screenManager: widget.screenManager,
        ));
  }

  void addGroup() {
    showDialog(
        context: context,
        builder: (context) => AddGroupAlertDialog(
          screen: widget.screen,
          screenManager: widget.screenManager,
        ));
  }
}

class AddTemplateAlertDialog extends StatefulWidget {
  final Screen screen;
  final ScreenManager screenManager;

  const AddTemplateAlertDialog(
      {Key? key, required this.screen, required this.screenManager})
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
    templates.removeWhere((element) => widget.screen.widgetTemplates.contains(element));
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
        title: const Text("Select Widget Template"),
        actions: [
          TextButton(onPressed: cancel, child: const Text("Cancel")),
          TextButton(onPressed: add, child: const Text("Add")),
        ],
        content: TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: "Group Name"),
        )
    );
  }

  void add() {
    widget.screen.addGroup(CustomGroupWidget(name: _nameController.text), widget.screenManager);
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
    final state = context.watch<ScreenListCubit>().state;
    List<dynamic> templates = screen.widgetTemplates;

    return ReorderableListView.builder(
      itemCount: templates.length,
      onReorder: (int oldIndex, int newIndex) {
        screen.reorderWidgetTemplates(oldIndex: oldIndex, newIndex: newIndex, screenManager: screenManager);
      },
      itemBuilder: (BuildContext context, int index) {
        if (templates.length> index && templates[index] is CustomWidgetTemplate) {
          return Dismissible(
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
            onDismissed: (d) => screen.removeWidgetTemplate(screenManager, templates[index]),
            key: ValueKey(templates[index]),
            child: CustomWidgetTemplateTile(customWidget: templates[index], customWidgetManager: screenManager.manager.customWidgetManager,)
          );
        } else {
          return Dismissible(
            key: ValueKey(templates[index]),
            onDismissed: (d) => screen.removeWidgetTemplate(screenManager, templates[index]),
            child: CustomGroupWidgetTile(customGroupWidget: templates[index]),
          );
        }

      }

    );
  }
}