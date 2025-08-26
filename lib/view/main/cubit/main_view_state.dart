part of 'main_view_cubit.dart';

abstract class MainViewState {
  final ConnectionStatus connectionStatus;
  final List<Screen> screens;
  final int currentScreen;
  const MainViewState({
    required this.connectionStatus,
    required this.screens,
    required this.currentScreen,
  });
}

class MainViewStateInitial extends MainViewState {
  const MainViewStateInitial({required super.connectionStatus})
    : super(screens: const [], currentScreen: 0);
}

class MainViewStateLoaded extends MainViewState {
  const MainViewStateLoaded({
    required super.screens,
    required super.connectionStatus,
  }) : super(currentScreen: 0);
}
