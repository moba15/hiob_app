import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/cubit/widget_template_list_cubit.dart';

import '../../../../customwidgets/templates/custom_widget_template.dart';
import '../../../../customwidgets/view/custom_widget_tile.dart';
import '../../../../utils/list_status.dart';

class WidgetTemplateListPage extends StatelessWidget {
  final CustomWidgetManager customWidgetManager;

  const WidgetTemplateListPage({Key? key, required this.customWidgetManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Templates"),
      ),
      body: BlocProvider(
        create: (_) =>
            WidgetTemplateListCubit(customWidgetManager: customWidgetManager)
              ..fetchList(),
        child: const WidgetTemplateListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => TemplateAddPage(
                    customWidgetManager: customWidgetManager,
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
  final List<CustomWidgetTemplate> templates;

  const TemplatesView({Key? key, required this.templates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return templates.isEmpty
        ? const Center(
            child: Text("Es konnten keine screens gefunden werden"),
          )
        : ReorderableListView.builder(
            itemCount: templates.length,
      itemBuilder: (BuildContext c, int index) =>
                CustomWidgetTemplateTile(
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
  final CustomWidgetManager customWidgetManager;

  const TemplateAddPage({Key? key, required this.customWidgetManager})
      : super(key: key);

  @override
  State<TemplateAddPage> createState() => _TemplateAddPageState();
}

class _TemplateAddPageState extends State<TemplateAddPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();
  Icon icon = const Icon(Icons.insert_emoticon);
  CustomWidgetType selectedType = CustomWidgetType.text;

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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<CustomWidgetType>(
              items: [
                for (CustomWidgetType c in CustomWidgetType.values)
                  DropdownMenuItem(
                    child: Text(c.name),
                    value: c,
                  )
              ],
              value: selectedType,
              onChanged: (CustomWidgetType? type) {
                setState(() {
                  selectedType = type!;
                });
              },
            ),
            RepositoryProvider.value(
              value: widget.customWidgetManager,
              child: selectedType.getSettingWidget(),
            )
          ],
        ));
  }

  void save() {
    String name = nameController.text;
    String iconID = iconController.text;
    int index = int.parse(indexController.text);
    /*widget.screenManager.addScreen(Screen(
        id: "idsdfsf",
        name: name,
        iconID: iconID,
        index: index,
        widgetIds: [])); */
    Navigator.pop(context);
  }
}

class TemplateEditPage extends StatefulWidget {
  final CustomWidgetTemplate template;
  final ScreenManager screenManager;

  const TemplateEditPage(
      {Key? key, required this.template, required this.screenManager})
      : super(key: key);

  @override
  State<TemplateEditPage> createState() =>
      _TemplateEditPageState(template: template);
}

class _TemplateEditPageState extends State<TemplateEditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();

  _TemplateEditPageState({required CustomWidgetTemplate template}) {
    nameController.text = template.name;
  }

  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  Widget build(BuildContext context) {
    return const Text("ok");
  }
}
