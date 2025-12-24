import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/services/connection_service_interface.dart';

import '../../../manager/connection/connection_manager.dart';
import '../../../screen/screen.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit()
    : super(
        MainViewStateInitial(
          connectionStatus: Manager.instance.connectionManager
              .getConnectionStatus(),
        ),
      ) {
    _fetchList();
  }

  void _fetchList() async {
    List<Screen> screens = await Manager().screenManager.loadScreens();
    emit(
      MainViewStateLoaded(
        screens: screens,
        connectionStatus: Manager.instance.connectionManager
            .getConnectionStatus(),
      ),
    );
    _listenToConnectionChanges();
    _listenToScreenChanges();
  }

  void _listenToConnectionChanges() {
    Manager.instance.connectionManager.connectionStatusStream.listen((event) {
      emit(
        MainViewStateLoaded(screens: state.screens, connectionStatus: event),
      );
    });
  }

  void _listenToScreenChanges() {
    Manager.instance.screenManager.screenStreamController.stream.listen((
      event,
    ) {
      emit(
        MainViewStateLoaded(
          screens: event,
          connectionStatus: state.connectionStatus,
        ),
      );
    });
  }

  void listenToTemplateChanges() {
    Manager.instance.customWidgetManager.templatesStreamController.stream
        .listen((event) {
          emit(
            MainViewStateLoaded(
              screens: state.screens,
              connectionStatus: state.connectionStatus,
            ),
          );
        });
  }
}
