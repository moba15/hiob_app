import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/utils/list_status.dart';

part 'widget_template_list_state.dart';

class WidgetTemplateListCubit extends Cubit<WidgetTemplateListState> {
  WidgetTemplateListCubit({required CustomWidgetManager customWidgetManager})
      : super(WidgetTemplateListState(
            templates: const [],
            customWidgetManager: customWidgetManager,
            status: ListStatus.loading));
}
