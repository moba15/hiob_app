part of 'main_view_cubit.dart';

abstract class MainViewState  {
  final ConnectionStatus connectionStatus;
  final List<Screen> screens;
  const MainViewState({required this.connectionStatus, required this.screens});
}

class MainViewStateInitial extends MainViewState {
  const MainViewStateInitial({ required ConnectionStatus connectionStatus}): super(connectionStatus: connectionStatus, screens:  const []);
}
class MainViewStateLoaded extends MainViewState{
  const MainViewStateLoaded({required List<Screen> screens, required ConnectionStatus connectionStatus}) : super(connectionStatus: connectionStatus, screens: screens );
}