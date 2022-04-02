part of 'widget_template_list_cubit.dart';

@immutable
class WidgetTemplateListState {
  final List<CustomWidgetTemplate> templates;
  final ListStatus status;

  const WidgetTemplateListState(
      {required this.templates, required this.status});
}
