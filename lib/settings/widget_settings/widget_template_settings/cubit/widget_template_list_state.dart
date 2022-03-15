part of 'widget_template_list_cubit.dart';

@immutable
class WidgetTemplateListState {
  final CustomWidgetManager customWidgetManager;
  final List<CustomWidget> templates;
  final ListStatus status;

  const WidgetTemplateListState(
      {required this.templates,
      required this.customWidgetManager,
      required this.status});

  Future<void> fetchList() async {
    await customWidgetManager.loadTemplates();
  }
}
