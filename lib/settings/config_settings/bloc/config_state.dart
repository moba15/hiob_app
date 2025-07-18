part of 'config_bloc.dart';

class ConfigState {
  final List<String> configs;

  ConfigState({this.configs = const []});
}

class ConfigStateLoading extends ConfigState {}
