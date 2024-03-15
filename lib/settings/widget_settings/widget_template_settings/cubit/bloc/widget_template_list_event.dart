part of 'widget_template_list_bloc.dart';

class WidgetTemplateListEvent extends Equatable {
  const WidgetTemplateListEvent();

  @override
  List<Object> get props => [];
}

class WidgetTemplateListToggleSelectionEvent extends WidgetTemplateListEvent {
  final bool selection;
  const WidgetTemplateListToggleSelectionEvent({required this.selection});
}

class WidgetTemplateLoadedEvent extends WidgetTemplateListEvent {
  final List<CustomWidgetTemplate> templates;
  const WidgetTemplateLoadedEvent({required this.templates});
}

class WidgetTemplateToggleSelectEvent extends WidgetTemplateListEvent {
  final CustomWidgetTemplate template;
  final bool selection;

  const WidgetTemplateToggleSelectEvent(
      {required this.template, required this.selection});
}

class WidgetTemplateDeletSelectedEvent extends WidgetTemplateListEvent {}

class WidgetTemplateCopySelectedEvent extends WidgetTemplateListEvent {}
