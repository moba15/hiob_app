import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/repository/general_repository.dart';
import 'package:smart_home/repository/notification_repository.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/services/notification/custom_notification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `Firebase.initializeApp()` before using other Firebase services.
  debugPrint("Handling a background message: ${message.messageId}");
}

class NotificationServiceImpl with WidgetsBindingObserver {
  final SupabaseClient supabase = Supabase.instance.client;
  final NotificationRepository notificationRepository;
  final GeneralRepository generalRepository;

  final StreamController<void> _notificationStreamController =
      StreamController<void>.broadcast();

  NotificationServiceImpl({
    required this.notificationRepository,
    required this.generalRepository,
  }) {
    WidgetsBinding.instance.addObserver(this);
    _initAwesomeNotifications();
    unawaited(_tryLoginOnStartup());
  }

  void _initAwesomeNotifications() {
    AwesomeNotifications().initialize(
      null, // null for default icon
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50BB),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        ),
      ],
      debug: true,
    );
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
    if (!await _initFirebaseMessaging()) {
      LoggingService.instance.error(
        "NotificationService | Failed to initialize Firebase Messaging. Notifications might not work properly.",
        null,
      );
      updateAuthStatus(NotificationAuthStatus.error);
    }
  }

  Future<bool> _initFirebaseMessaging() async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final notificationSettings = await FirebaseMessaging.instance
            .requestPermission(provisional: true);

        if (notificationSettings.authorizationStatus ==
                AuthorizationStatus.authorized ||
            notificationSettings.authorizationStatus ==
                AuthorizationStatus.provisional) {
          FirebaseMessaging.onMessage.listen(_handleMessage);
          FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler,
          );

          String? token = await FirebaseMessaging.instance.getToken();
          if (token != null) {
            await _registerFCMToken(token);
          }

          FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
            _registerFCMToken(newToken);
          });

          return true;
        }
      }
      return false;
    } catch (e) {
      LoggingService.instance.error(
        "NotificationService | Error initializing Firebase Messaging: $e",
        e,
      );
      return false;
    }
  }

  Future<void> _registerFCMToken(String token) async {
    try {
      LoggingService.instance.verbose(
        "NotificationService | Registering FCM token",
      );
      await supabase.functions.invoke(
        'register-fcm-token',
        body: {
          'fcm_token': token, 
          'device_name': generalRepository.deviceName,
          'device_id': generalRepository.deviceID,
        },
      );
    } catch (e) {
      LoggingService.instance.error(
        "NotificationService | Error registering FCM token: $e",
        e,
      );
    }
  }

  void _handleMessage(RemoteMessage message) {
    LoggingService.instance.verbose(
      "NotificationService | Handling message: ${message.messageId}",
    );
    final notification = CustomNotification(
      title: message.notification?.title ?? "Notification",
      bodyText: message.notification?.body ?? "",
      dateTime: DateTime.now(),
    );

    notificationRepository.notificationLog.insert(0, notification);
    notificationRepository.saveNotificationLog();
    _notificationStreamController.add(null);

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'basic_channel',
        title: notification.title,
        body: notification.bodyText,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  bool get backgroundNotificationsEnabled {
    return notificationRepository.backgroundNotificationsEnabled;
  }

  String get userUuid => notificationRepository.userUuid;

  NotificationAuthStatus get authStatus => notificationRepository.authStatus;

  Future<String> getPassword() {
    return notificationRepository.getPassword();
  }

  Future<void> changeBackgroundNotificationsEnabled(bool enabled) async {
    await notificationRepository.updateBackgroundNotificationsEnabled(enabled);
    if (enabled) {
      await _initFirebaseMessaging();
    }
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
      return await _initFirebaseMessaging()
          ? NotificationAuthStatus.loggedInAndEnabled
          : NotificationAuthStatus.error;
    } catch (e) {
      await updateAuthStatus(NotificationAuthStatus.error);
      LoggingService.instance.error(
        "NotificationService | login error during login",
        e,
      );
      return NotificationAuthStatus.error;
    }
  }

  Stream<void> get notificationStream => _notificationStreamController.stream;

  List<CustomNotification> get notificationsLog =>
      notificationRepository.notificationLog;

  int get unreadNotifications =>
      notificationRepository.notificationLog.where((e) => !e.read).length;

  void readAllNotifications() {
    for (var n in notificationRepository.notificationLog) {
      n.read = true;
    }
    notificationRepository.saveNotificationLog();
    _notificationStreamController.add(null);
  }

  void removeNotificationLog({required int index}) {
    if (index >= 0 && index < notificationRepository.notificationLog.length) {
      notificationRepository.notificationLog.removeAt(index);
      notificationRepository.saveNotificationLog();
      _notificationStreamController.add(null);
    }
  }

  void deleteAllNotifications() {
    notificationRepository.clearNotificationLog();
    _notificationStreamController.add(null);
  }
}
