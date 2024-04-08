part of 'notifications_bloc.dart';

class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class NotificationsAddEvent extends NotificationsEvent {}

class NotificationsRemoveEvent extends NotificationsEvent {
  int index;
  NotificationsRemoveEvent({required this.index});
}

class NotificationsReadEvent extends NotificationsEvent {}

class NotificationsGetEvent extends NotificationsEvent {}

class NotificationsDeleteAllEvent extends NotificationsEvent {}
