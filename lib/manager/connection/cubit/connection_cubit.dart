import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/manager.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription connectionSub;

  ConnectionCubit({required ConnectionStatus status}) : super(status) {
    connectionSub = Manager
        .instance!.connectionManager.connectionStatusStreamController.stream
        .listen((event) {
      emit(event);
    });
  }
}
