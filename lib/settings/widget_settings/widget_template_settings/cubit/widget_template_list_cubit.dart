import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
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

  Future<void> fetchList() async {
    await customWidgetManager.loadTemplates();
  }

  void update(List<CustomWidget> templates) {
    emit(WidgetTemplateListState(
        templates: templates, status: ListStatus.success));
  }
}
