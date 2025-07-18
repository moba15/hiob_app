part of 'widget_template_list_bloc.dart';

class WidgetTemplateListState {
  final Map<CustomWidgetWrapper, bool> templates;
  final ListStatus status;
  final bool toggleSelection;

  const WidgetTemplateListState({
    required this.templates,
    required this.status,
    required this.toggleSelection,
  });
}
