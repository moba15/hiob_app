import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/custom_notification.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  StreamSubscription? _streamSubscription;
  NotificationsBloc() : super(const NotificationsInitial()) {
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

    _streamSubscription = Manager
        .instance
        .notificationManager
        .notificationStream
        .listen((event) {
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
        customNotification: NotificationManager.notificationsLog,
      ),
    );
  }

  void readAllNotifications(Emitter<NotificationsState> emit) {
    Manager.instance.notificationManager.readAllNotifications();
  }

  void removeNotification(
    NotificationsRemoveEvent event,
    Emitter<NotificationsState> emit,
  ) {
    Manager.instance.notificationManager.removeNotificationLog(
      index: event.index,
    );
    NotificationsLoaded newState = NotificationsLoaded(
      customNotification: NotificationManager.notificationsLog,
    );
    emit(newState);
  }

  void deleteAllNotifications(Emitter<NotificationsState> emit) {
    Manager.instance.notificationManager.deletAllNotifications();
    emit(const NotificationsLoaded(customNotification: []));
  }
}
