import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/manager.dart';

import '../../../preconfigs/preconfig.dart';

part 'config_event.dart';

part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigState()) {
    on<ConfigEvent>((event, emit) {
      if (event is ConfigAddedEvent) {
        _onConfigAdded(emit);
      } else if (event is ConfigLoadedEvent) {
        emit(ConfigStateLoading());
        emit(ConfigState(configs: (event).list));
      } else if (event is ConfigReloadEvent) {
        _fetch();
      }
    });
  }

  void _fetch() async {
    List<PreConfig> list = await Manager.instance.settingsSyncManager
        .fetchTemplatesFromAdapter();

    add(ConfigLoadedEvent(list));
  }

  void _onConfigAdded(emit) async {
    List<PreConfig> list = await Manager.instance.settingsSyncManager
        .fetchTemplatesFromAdapter();

    add(ConfigLoadedEvent(list));
  }
}
