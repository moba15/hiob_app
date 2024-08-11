import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/utils/list_status.dart';

part 'widget_template_list_event.dart';
part 'widget_template_list_state.dart';

class WidgetTemplateListBloc
    extends Bloc<WidgetTemplateListEvent, WidgetTemplateListState> {
  final CustomWidgetManager customWidgetManager;
  StreamSubscription? templateListSubscription;
  WidgetTemplateListBloc({required this.customWidgetManager})
      : super(const WidgetTemplateListState(
            templates: {},
            status: ListStatus.loading,
            toggleSelection: false)) {
    on<WidgetTemplateListToggleSelectionEvent>((event, emit) {
      emit(WidgetTemplateListState(
          templates: state.templates,
          status: state.status,
          toggleSelection: event.selection));
    });

    on<WidgetTemplateLoadedEvent>((event, emit) {
      emit(WidgetTemplateListState(
          templates:
              Map.fromEntries(event.templates.map((e) => MapEntry(e, false))),
          status: ListStatus.success,
          toggleSelection: state.toggleSelection));
    });

    on<WidgetTemplateToggleSelectEvent>(((event, emit) {
      emit(WidgetTemplateListState(
          templates: state.templates,
          status: ListStatus.success,
          toggleSelection: state.toggleSelection));
    }));

    on<WidgetTemplateDeletSelectedEvent>((event, emit) {
      customWidgetManager.removeTemplates(state.templates.keys
          .where((element) => state.templates[element] ?? false)
          .toList());
      emit(WidgetTemplateListState(
          templates: Map.fromEntries(
              customWidgetManager.templates.map((e) => MapEntry(e, false))),
          status: ListStatus.success,
          toggleSelection: false));
    });
    on<WidgetTemplateCopySelectedEvent>((event, emit) {
      customWidgetManager.copyTemplates(state.templates.keys
          .where((element) => state.templates[element] ?? false)
          .toList());
      emit(WidgetTemplateListState(
          templates: Map.fromEntries(
              customWidgetManager.templates.map((e) => MapEntry(e, false))),
          status: ListStatus.success,
          toggleSelection: false));
    });
    templateListSubscription =
        customWidgetManager.templatesStreamController.stream.listen((event) {
      update(event);
    });
  }

  @override
  Future<void> close() async {
    templateListSubscription?.cancel();
    super.close();
  }

  Future<void> fetchList() async {
    await customWidgetManager.loadTemplates();
  }

  void update(List<CustomWidgetWrapper> templates) {
    add(WidgetTemplateLoadedEvent(templates: templates));
  }
}
