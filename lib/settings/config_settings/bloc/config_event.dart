part of 'config_bloc.dart';

abstract class ConfigEvent {}

class ConfigAddedEvent extends ConfigEvent {}

class ConfigLoadedEvent extends ConfigEvent {
  final List<String> list;

  ConfigLoadedEvent(this.list);
}

class ConfigReloadEvent extends ConfigEvent {}
