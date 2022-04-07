import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/screen/view/screen_tile.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';

import '../../../../utils/list_status.dart';

class ScreenListPage extends StatelessWidget {
  const ScreenListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Settings"),
      ),
      body: BlocProvider(
        create: (_) => ScreenListCubit(screenManager: context.read<ScreenManager>())..fetchList(),
        child: ScreenListView(),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) =>  ScreenAddPage(screenManager: context.read<ScreenManager>(),)));
        },
        child: const Icon(Icons.add),
        tooltip: "Neues Gerät Hinzufügen",
      ),
    );
  }
}



class ScreenListView extends StatelessWidget {
  const ScreenListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScreenListCubit>().state;
    switch (state.status) {
      case ListStatus.loading:
        return const Center(child: CircularProgressIndicator(),);
      case ListStatus.failure:
        return const Center(child: Text("Ups da ist ein fehler aufgetreten"),);
      case ListStatus.success:
        return ScreensView(screens: state.screens);
    }

  }
}

class ScreensView extends StatelessWidget {
  final List<Screen> screens;
  const ScreensView({Key? key, required this.screens }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screens.isEmpty ?
        const Center(child: Text("Es konnten keine screens gefunden werden"),)
        :
        ReorderableListView.builder(
          itemCount: screens.length,
            itemBuilder: (BuildContext c, int index) => Dismissible(
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
              onDismissed: (d) => {context.read<ScreenManager>().removeScreen(screens[index])},
              key: ValueKey(screens[index]),
              child: ScreenListTile(
                screen: screens[index],
                screenManager: context.read<ScreenManager>(),
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              context.read<ScreenManager>().reorderScreen(oldIndex: oldIndex, newIndex: newIndex);
            },
          );
  }
}

class ScreenAddPage extends StatefulWidget {
  final ScreenManager screenManager;

  const ScreenAddPage({Key? key, required this.screenManager})
      : super(key: key);

  @override
  State<ScreenAddPage> createState() => _ScreenAddPageState();
}

class _ScreenAddPageState extends State<ScreenAddPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.save),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                onChanged: (value) {
                  if (int.tryParse(value, radix: 16) != null) {
                    setState(() {
                      icon = Icon(IconData(int.parse(value, radix: 16),
                          fontFamily: 'MaterialIcons'));
                    });
                  }
                },
                controller: iconController,
                decoration:
                    InputDecoration(hintText: "IconID", suffixIcon: icon),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: indexController,
                decoration: const InputDecoration(hintText: "Index"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
          ],
        ),
      ),
    );
  }

  void save() {
    String name = nameController.text;
    String iconID = iconController.text;
    int index = int.parse(indexController.text);
    widget.screenManager.addScreen(Screen(
        id: widget.screenManager.manager.getRandString(12),
        name: name,
        iconID: iconID,
        index: index,
        widgetTemplates: []));
    Navigator.pop(context);
  }
}

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
  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();

  _ScreenEditPageState({required Screen screen}) {
    nameController.text = screen.name;
    iconController.text = screen.iconID;
    indexController.text = screen.index.toString();
    icon = Icon(IconData(int.parse(screen.iconID, radix: 16),
        fontFamily: 'MaterialIcons'));
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
              child: TextField(
                onChanged: (value) {
                  if (int.tryParse(value, radix: 16) != null) {
                    setState(() {
                      icon = Icon(IconData(int.parse(value, radix: 16),
                          fontFamily: 'MaterialIcons'));
                    });
                  }
                },
                controller: iconController,
                decoration: InputDecoration(
                    labelText: "IconID",
                    suffixIcon: icon,
                    border: const UnderlineInputBorder()),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: indexController,
                decoration: const InputDecoration(labelText: "Index"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
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
        iconID: iconController.text,
        index: int.parse(indexController.text));
    Navigator.pop(context);
  }

  void addTemplate() {
    //widget.screen.addWidgetTemplate(widget.screenManager, CustomWidgetTemplate(id: "id", name: "name", customWidget: CustomTextWidget(name: "", text: CustomTextAttribute(data: ""))));
    List<CustomWidgetTemplate> templates =
        widget.screenManager.manager.customWidgetManager.templates;
    showDialog(
        context: context,
        builder: (context) => AddTemplateAlertDialog(
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
        widget.screenManager.manager.customWidgetManager.templates;
    return AlertDialog(
        title: const Text("Select Widget Template"),
        actions: [
          TextButton(onPressed: cancel, child: const Text("Cancel")),
          TextButton(onPressed: add, child: const Text("Add")),
        ],
        content: Container(
          height: 500,
          width: 100,
          child: ListView(
            children: [
              for (CustomWidgetTemplate t in templates)
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
                  subtitle: Text(t.customWidget.type.toString()),
                )
            ],
          ),
        ));
  }

  void add() {
    widget.screen.addWidgetTemplates(widget.screenManager, selected);
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
    List<CustomWidgetTemplate> templates =
        screenManager.manager.customWidgetManager.templates.where((element) {
      return screen.widgetTemplates.contains(element.id);
    }).toList();
    return ReorderableListView.builder(
      itemCount: templates.length,
      onReorder: (int oldIndex, int newIndex) {
        screen.reorderWidgetTemplates(oldIndex: oldIndex, newIndex: newIndex, screenManager: screenManager);
      },
      itemBuilder: (BuildContext context, int index)  {
        return ListTile(
          key: ValueKey(templates[index]),
          title: Text(templates[index].name),
          trailing: IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () => {screen.removeWidgetTemplate(screenManager, templates[index])},
            color: Colors.red,
          ),
        );
      },

    );
  }
}
