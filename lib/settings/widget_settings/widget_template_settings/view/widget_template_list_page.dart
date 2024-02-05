import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/cubit/widget_template_list_cubit.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

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
        title: Text(
            getAppLocalizations(context).template_widget_settings_page_title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home)),
        ],
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
        tooltip: "Neues Template hinzufügen",
        child: const Icon(Icons.add),
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
        ? Center(
            child: Text(getAppLocalizations(context).no_templates_found),
          )
        : ListView(
            children: [
              for (CustomWidgetType type in CustomWidgetType.values
                  .where((element) => element != CustomWidgetType.group))
                if (templates
                    .any((element) => element.customWidget.type == type))
                  ExpansionTile(
                    title: Text(
                        "${type.name} (${templates.where((element) => element.customWidget.type == type).length})"),
                    children: [
                      for (CustomWidgetTemplate t in templates.where(
                          (element) => element.customWidget.type == type))
                        Dismissible(
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Icon(Icons.delete_forever),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Icon(Icons.delete_forever),
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          key: ValueKey(t),
                          onDismissed: (d) => {_delete(t)},
                          child: CustomWidgetTemplateTile(
                            customWidget: t,
                            customWidgetManager: context
                                .read<WidgetTemplateListCubit>()
                                .customWidgetManager,
                          ),
                        ),
                    ],
                  ),
            ],
          );
  }

  void _delete(CustomWidgetTemplate template) {
    Manager.instance.customWidgetManager.removeTemplate(template);
  }
}
