import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/cubit/widget_template_list_cubit.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';

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
        ?
    const Center(
            child: Text("Es konnten keine Widget Templates gefunden werden"),
          )
        :
    ListView.builder(
      itemCount: templates.length,
      itemBuilder: (BuildContext c, int index) =>
          Dismissible(
            key: ValueKey(templates[index]),
            onDismissed: (d) => {_delete(index)},
            child: CustomWidgetTemplateTile(
              customWidget: templates[index],
              customWidgetManager: context.read<WidgetTemplateListCubit>().customWidgetManager,
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
          ),
    );
  }

  void _delete(int index) {


    Manager.instance?.customWidgetManager.removeTemplate(templates[index]);
  }
}


