import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/services/connection_service_interface.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription connectionSub;

  ConnectionCubit({
    required ConnectionStatus status,
    required Stream<ConnectionStatus> connectionStatusStream,
  }) : super(status) {
    connectionSub = connectionStatusStream.listen((event) {
      emit(event);
    });
  }
}
