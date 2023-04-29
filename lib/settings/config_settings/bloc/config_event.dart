part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent {}

class ConfigAddedEvent extends ConfigEvent {}

class ConfigLoadedEvent extends ConfigEvent {
  final List<PreConfig> list;

  ConfigLoadedEvent(this.list);
}

class ConfigReloadEvent extends ConfigEvent {}
