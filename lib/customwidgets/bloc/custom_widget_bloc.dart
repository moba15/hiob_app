import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../device/device.dart';

part 'custom_widget_event.dart';

part 'custom_widget_state.dart';

class CustomWidgetBloc extends Bloc<CustomWidgetEvent, CustomWidgetState> {
  CustomWidgetBloc({required settings, required device})
    : super(CustomWidgetState(device: device, settings: settings)) {
    on<CustomWidgetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
