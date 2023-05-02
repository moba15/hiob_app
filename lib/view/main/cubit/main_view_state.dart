part of 'main_view_cubit.dart';

abstract class MainViewState  {
  final ConnectionStatus connectionStatus;
  final List<Screen> screens;
  const MainViewState({required this.connectionStatus, required this.screens});
}

class MainViewStateInitial extends MainViewState {
  const MainViewStateInitial(): super(connectionStatus: ConnectionStatus.disconnected, screens:  const []);
}
class MainViewStateLoaded extends MainViewState{
  const MainViewStateLoaded({required List<Screen> screens, ConnectionStatus connectionStatus = ConnectionStatus.disconnected}) : super(connectionStatus: connectionStatus, screens: screens );
}