import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/utils/list_status.dart';

part 'widget_template_list_state.dart';

class WidgetTemplateListCubit extends Cubit<WidgetTemplateListState> {
  final CustomWidgetManager customWidgetManager;
  StreamSubscription? templateListSubscription;

  WidgetTemplateListCubit({required this.customWidgetManager})
      : super(const WidgetTemplateListState(
            templates: [], status: ListStatus.loading)) {
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
    emit(WidgetTemplateListState(
        templates: templates, status: ListStatus.success));
  }
}
