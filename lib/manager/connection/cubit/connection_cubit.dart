import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/services/connection_service_interface.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription connectionSub;

  ConnectionCubit({required ConnectionStatus status}) : super(status) {
    connectionSub = Manager.instance.connectionManager.connectionStatusStream
        .listen((event) {
          emit(event);
        });
  }
}
