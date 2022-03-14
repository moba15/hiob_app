part of 'widget_template_list_cubit.dart';

@immutable
class WidgetTemplateListState {
  final CustomWidgetManager customWidgetManager;
  final List<CustomWidget> templates;

  const WidgetTemplateListState(
      {required this.templates, required this.customWidgetManager});

  Future<void> fetchList() async {
    await customWidgetManager.loadTemplates();
  }
}
