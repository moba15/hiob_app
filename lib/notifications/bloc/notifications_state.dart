part of 'notifications_bloc.dart';

class NotificationsState {
  final List<CustomNotification> customNotification;
  const NotificationsState({required this.customNotification});
}

class NotificationsInitial extends NotificationsState {
  const NotificationsInitial() : super(customNotification: const []);
}

class NotificationsLoaded extends NotificationsState {
  const NotificationsLoaded({
    required List<CustomNotification> customNotification,
  }) : super(customNotification: customNotification);
}
