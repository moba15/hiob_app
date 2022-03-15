import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/cubit/widget_template_list_cubit.dart';

import '../../../../customwidgets/view/custom_widget_tile.dart';
import '../../../../utils/list_status.dart';

class WidgetTemplateListPage extends StatelessWidget {
  const WidgetTemplateListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Templates"),
      ),
      body: BlocProvider(
        create: (_) =>
            ScreenListCubit(screenManager: context.read<ScreenManager>())
              ..fetchList(),
        child: const WidgetTemplateListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => TemplateAddPage(
                        screenManager: context.read<ScreenManager>(),
                      )));
        },
        child: const Icon(Icons.add),
        tooltip: "Neues Template hinzufügen",
      ),
    );
  }
}

class WidgetTemplateListView extends StatelessWidget {
  const WidgetTemplateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WidgetTemplateListCubit>().state;
    switch (state.status) {
      case ListStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ListStatus.failure:
        return const Center(
          child: Text("Ups da ist ein fehler aufgetreten"),
        );
      case ListStatus.success:
        return TemplatesView(templates: state.templates);
    }
  }
}

class TemplatesView extends StatelessWidget {
  final List<CustomWidget> templates;

  const TemplatesView({Key? key, required this.templates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return templates.isEmpty
        ? const Center(
            child: Text("Es konnten keine screens gefunden werden"),
          )
        : ReorderableListView.builder(
            itemCount: templates.length,
            itemBuilder: (BuildContext c, int index) => CustomWidgetTile(
              key: ValueKey(index),
              customWidget: templates[index],
            ),
            onReorder: (oldIndex, newIndex) {
              context.read<ScreenManager>().reorderScreen(oldIndex, newIndex);
            },
          );
  }
}

class TemplateAddPage extends StatefulWidget {
  final ScreenManager screenManager;

  const TemplateAddPage({Key? key, required this.screenManager})
      : super(key: key);

  @override
  State<TemplateAddPage> createState() => _TemplateAddPageState();
}

class _TemplateAddPageState extends State<TemplateAddPage> {
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
        id: "idsdfsf",
        name: name,
        iconID: iconID,
        index: index,
        widgetIds: []));
    Navigator.pop(context);
  }
}

class TemplateEditPage extends StatefulWidget {
  final Screen screen;
  final ScreenManager screenManager;

  const TemplateEditPage(
      {Key? key, required this.screen, required this.screenManager})
      : super(key: key);

  @override
  State<TemplateEditPage> createState() =>
      _TemplateEditPageState(screen: screen);
}

class _TemplateEditPageState extends State<TemplateEditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();

  _TemplateEditPageState({required Screen screen}) {
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
    widget.screenManager.editScreen(
        screen: widget.screen,
        name: nameController.text,
        iconID: iconController.text,
        index: int.parse(indexController.text));
    Navigator.pop(context);
  }
}
