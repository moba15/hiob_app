import 'package:bloc/bloc.dart';
import 'package:smart_home/services/impl/iobroker/settings_sync_manager.dart';

part 'config_event.dart';

part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final IoBrokerSettingsSyncService settingsSyncManager;

  ConfigBloc({required this.settingsSyncManager}) : super(ConfigState()) {
    on<ConfigEvent>((event, emit) {
      if (event is ConfigAddedEvent) {
        _onConfigAdded(emit);
      } else if (event is ConfigLoadedEvent) {
        emit(ConfigStateLoading());
        emit(ConfigState(configs: event.list));
      } else if (event is ConfigReloadEvent) {
        _fetch();
      }
    });
  }

  void _fetch() async {
    List<String> list = await settingsSyncManager.fetchTemplatesFromAdapter();

    add(ConfigLoadedEvent(list));
  }

  void _onConfigAdded(Emitter<ConfigState> emit) async {
    List<String> list = await settingsSyncManager.fetchTemplatesFromAdapter();

    add(ConfigLoadedEvent(list));
  }
}
