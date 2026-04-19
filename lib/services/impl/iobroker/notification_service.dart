import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/repository/notification_repository.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/services/notification/custom_notification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationServiceImpl with WidgetsBindingObserver {
  final SupabaseClient supabase = Supabase.instance.client;
  final NotificationRepository notificationRepository;

  NotificationServiceImpl({required this.notificationRepository}) {
    WidgetsBinding.instance.addObserver(this);
    unawaited(_tryLoginOnStartup());
  }

  Future<void> _tryLoginOnStartup() async {
    if (!backgroundNotificationsEnabled || userUuid.isEmpty) {
      return;
    }

    final String password = await getPassword();
    if (password.isEmpty) {
      return;
    }

    await login(userUuid: userUuid, password: password);
  }

  bool get backgroundNotificationsEnabled {
    return notificationRepository.backgroundNotificationsEnabled;
  }

  String get userUuid => notificationRepository.userUuid;

  NotificationAuthStatus get authStatus => notificationRepository.authStatus;

  Future<String> getPassword() {
    return notificationRepository.getPassword();
  }

  Future<void> changeBackgroundNotificationsEnabled(bool enabled) {
    return notificationRepository.updateBackgroundNotificationsEnabled(enabled);
  }

  Future<void> updateUserUuid(String uuid) {
    return notificationRepository.updateUserUuid(uuid);
  }

  Future<void> updatePassword(String password) {
    return notificationRepository.updatePassword(password);
  }

  Future<void> updateAuthStatus(NotificationAuthStatus status) {
    return notificationRepository.updateAuthStatus(status);
  }

  Future<NotificationAuthStatus> login({
    required String userUuid,
    required String password,
  }) async {
    await updateUserUuid(userUuid);
    await updatePassword(password);

    if (!backgroundNotificationsEnabled) {
      await updateAuthStatus(NotificationAuthStatus.loggedOut);
      return NotificationAuthStatus.loggedOut;
    }

    if (userUuid.isEmpty || password.isEmpty) {
      await updateAuthStatus(NotificationAuthStatus.error);
      return NotificationAuthStatus.error;
    }

    try {
      LoggingService.instance.verbose(
        "NotificationService | login attempt for userUuid: $userUuid@hiob-app.local",
      );
      await supabase.auth.signInWithPassword(
        email: "$userUuid@hiob-app.local",
        password: password,
      );
      await updateAuthStatus(NotificationAuthStatus.loggedInAndEnabled);
      return NotificationAuthStatus.loggedInAndEnabled;
    } catch (e) {
      await updateAuthStatus(NotificationAuthStatus.error);
      LoggingService.instance.error(
        "NotificationService | login error during login",
        e,
      );
      return NotificationAuthStatus.error;
    }
  }

  get notificationStream => Stream.empty();

  List<CustomNotification> get notificationsLog => [];
  int get unreadNotifications => 0;

  void readAllNotifications() {
    throw UnimplementedError();
  }

  void removeNotificationLog({required int index}) {
    throw UnimplementedError();
  }

  void deleteAllNotifications() {
    throw UnimplementedError();
  }
}
