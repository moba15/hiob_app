import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/cubit/bloc/widget_template_list_bloc.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

import '../../../../customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import '../../../../customwidgets/view/custom_widget_tile.dart';
import '../../../../utils/list_status.dart';

class WidgetTemplateListPage extends StatelessWidget {
  final CustomWidgetManager customWidgetManager;

  const WidgetTemplateListPage({Key? key, required this.customWidgetManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetTemplateListBloc bloc =
        WidgetTemplateListBloc(customWidgetManager: customWidgetManager)
          ..fetchList();
    return BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          appBar: const _WidgetTemplateListAppBar(),
          body: const _WidgetTemplateListView(),
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
        ));
  }
}

class _WidgetTemplateListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _WidgetTemplateListAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<WidgetTemplateListBloc>();

    return AppBar(
      actions: _getActions(bloc, context),
    );
  }

  List<Widget> _getActions(WidgetTemplateListBloc bloc, BuildContext context) {
    if (!bloc.state.toggleSelection) {
      return [
        IconButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            icon: const Icon(Icons.home))
      ];
    }
    IconButton deleteSelected = IconButton(
      onPressed: () => _removeSelectedWidgets(bloc),
      icon: const Icon(Icons.delete_forever),
    );

    IconButton copySelected = IconButton(
        onPressed: () => _copySelectedWidgets(bloc),
        icon: const Icon(Icons.copy_all));

    return [copySelected, deleteSelected];
  }

  void _removeSelectedWidgets(WidgetTemplateListBloc bloc) {
    bloc.add(WidgetTemplateDeletSelectedEvent());
  }

  void _copySelectedWidgets(WidgetTemplateListBloc bloc) {
    bloc.add(WidgetTemplateCopySelectedEvent());
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WidgetTemplateListView extends StatelessWidget {
  const _WidgetTemplateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WidgetTemplateListBloc>().state;
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

class TemplatesView extends StatefulWidget {
  final Map<CustomWidgetTemplate, bool> templates;

  const TemplatesView({Key? key, required this.templates}) : super(key: key);

  @override
  State<TemplatesView> createState() => _TemplatesViewState();
}

class _TemplatesViewState extends State<TemplatesView> {
  List<CustomWidgetType> types = [];
  bool selectionMode = false;

  @override
  void initState() {
    types.addAll(CustomWidgetType.values);
    types.removeWhere((type) => !widget.templates.keys
        .any((template) => template.customWidget.type == type));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetTemplateListBloc bloc = context.read<WidgetTemplateListBloc>();
    return widget.templates.isEmpty
        ? Center(
            child: Text(getAppLocalizations(context).no_templates_found),
          )
        : ListView.builder(
            itemCount: types.length,
            itemBuilder: (context, index) {
              CustomWidgetType type = types[index];
              List<Dismissible> children = [];
              for (CustomWidgetTemplate t in widget.templates.keys
                  .where((element) => element.customWidget.type == type)) {
                children.add(
                  Dismissible(
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
                    key: ValueKey(t),
                    onDismissed: (d) => {_delete(t)},
                    child: CustomWidgetTemplateTile(
                        customWidget: t,
                        customWidgetManager: bloc.customWidgetManager,
                        selectedMode: bloc.state.toggleSelection,
                        selected: bloc.state.templates[t] ?? false,
                        toggleSelect: () => toogleSelect(t, bloc)),
                  ),
                );
              }
              return ExpansionTile(
                title: Text(
                    "${type.name} (${widget.templates.keys.where((element) => element.customWidget.type == type).length})"),
                children: children,
              );
            },
          );
  }

  void _delete(CustomWidgetTemplate template) {
    Manager.instance.customWidgetManager.removeTemplate(template);
  }

  void toogleSelect(CustomWidgetTemplate t, WidgetTemplateListBloc bloc) {
    if (!selectionMode) {
      bloc.add(const WidgetTemplateListToggleSelectionEvent(selection: true));
    }
    bloc.add(WidgetTemplateToggleSelectEvent(
        template: t, selection: !(bloc.state.templates[t] ?? false)));
    widget.templates[t] = !(widget.templates[t] ?? false);
    if (!bloc.state.templates.values.contains(true)) {
      bloc.add(const WidgetTemplateListToggleSelectionEvent(selection: false));
    }
  }
}
