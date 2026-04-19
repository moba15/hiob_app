import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/services/notification/custom_notification.dart';
import 'package:smart_home/services/impl/iobroker/notification_service.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  StreamSubscription? _streamSubscription;
  final NotificationServiceImpl notificationService;

  NotificationsBloc({required this.notificationService})
    : super(const NotificationsInitial()) {
    on<NotificationsGetEvent>((event, emit) {
      loadNotifications(emit);
    });
    on<NotificationsRemoveEvent>((event, emit) {
      removeNotification(event, emit);
    });
    on<NotificationsReadEvent>((event, emit) {
      readAllNotifications(emit);
    });
    on<NotificationsDeleteAllEvent>((event, emit) {
      deleteAllNotifications(emit);
    });

    _streamSubscription = notificationService.notificationStream.listen((
      event,
    ) {
      add(NotificationsGetEvent());
    });
  }

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    super.close();
  }

  void loadNotifications(Emitter<NotificationsState> emit) {
    emit(
      NotificationsLoaded(
        customNotification: notificationService.notificationsLog,
      ),
    );
  }

  void readAllNotifications(Emitter<NotificationsState> emit) {
    notificationService.readAllNotifications();
  }

  void removeNotification(
    NotificationsRemoveEvent event,
    Emitter<NotificationsState> emit,
  ) {
    notificationService.removeNotificationLog(index: event.index);
    NotificationsLoaded newState = NotificationsLoaded(
      customNotification: notificationService.notificationsLog,
    );
    emit(newState);
  }

  void deleteAllNotifications(Emitter<NotificationsState> emit) {
    notificationService.deleteAllNotifications();
    emit(const NotificationsLoaded(customNotification: []));
  }
}
