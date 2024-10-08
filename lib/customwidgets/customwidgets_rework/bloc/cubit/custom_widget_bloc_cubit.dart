import 'package:bloc/bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';

class CustomWidgetBlocCubit extends Cubit<int> {
  CustomWidgetBlocCubit() : super(0);

  void update(CustomWidget? customWidget) {
    emit(state + 1);
  }
}
