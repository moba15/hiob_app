import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/custom_widget_repository.dart';
import 'package:smart_home/manager/screen_repository.dart';
import 'package:smart_home/services/connection/connection_service_interface.dart';

import '../../../screen/screen.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  final ConnectionServiceInterface _connectionService;
  final ScreenRepository _screenManager;
  final CustomWidgetRepository _customWidgetManager;
  StreamSubscription<ConnectionStatus>? _connectionSubscription;
  StreamSubscription<dynamic>? _screenSubscription;
  StreamSubscription<dynamic>? _templateSubscription;

  MainViewCubit({
    required ConnectionServiceInterface connectionService,
    required ScreenRepository screenManager,
    required CustomWidgetRepository customWidgetManager,
  }) : _connectionService = connectionService,
       _screenManager = screenManager,
       _customWidgetManager = customWidgetManager,
       super(
         MainViewStateInitial(
           connectionStatus: connectionService.getConnectionStatus(),
         ),
       ) {
    _fetchList();
  }

  void _fetchList() async {
    List<Screen> screens = await _screenManager.loadScreens();
    emit(
      MainViewStateLoaded(
        screens: screens,
        connectionStatus: _connectionService.getConnectionStatus(),
      ),
    );
    _listenToConnectionChanges();
    _listenToScreenChanges();
  }

  void _listenToConnectionChanges() {
    _connectionSubscription = _connectionService.connectionStatusStream.listen((
      event,
    ) {
      emit(
        MainViewStateLoaded(screens: state.screens, connectionStatus: event),
      );
    });
  }

  void _listenToScreenChanges() {
    _screenSubscription = _screenManager.screenStreamController.stream.listen((
      event,
    ) {
      emit(
        MainViewStateLoaded(
          screens: event as List<Screen>,
          connectionStatus: state.connectionStatus,
        ),
      );
    });
  }

  void listenToTemplateChanges() {
    _templateSubscription = _customWidgetManager
        .templatesStreamController
        .stream
        .listen((event) {
          emit(
            MainViewStateLoaded(
              screens: state.screens,
              connectionStatus: state.connectionStatus,
            ),
          );
        });
  }

  @override
  Future<void> close() async {
    await _connectionSubscription?.cancel();
    await _screenSubscription?.cancel();
    await _templateSubscription?.cancel();
    return super.close();
  }
}
