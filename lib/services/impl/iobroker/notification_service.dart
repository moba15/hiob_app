import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/repository/general_repository.dart';
import 'package:smart_home/repository/notification_repository.dart';
import 'package:smart_home/services/background_service_container.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/services/notification/custom_notification.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:smart_home/generated/notification/notification.pbgrpc.dart'
    as grpc;
import 'package:smart_home/services/connection/connection_service_interface.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `Firebase.initializeApp()` before using other Firebase services.
  debugPrint("Handling a background message: ${message.messageId}");

  final service = await BackgroundServiceContaier.create();

  if (service.connectionService.getConnectionStatus() !=
      ConnectionStatus.loggedIn) {
    try {
      await service.connectionService.connectionStatusStream
          .firstWhere((status) => status == ConnectionStatus.loggedIn)
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              throw TimeoutException(
                "Timeout waiting for login in background handler",
              );
            },
          );
    } catch (e) {
      debugPrint("Timeout or error waiting for login in background: $e");
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          channelKey: 'missing_messages_channel',
          title: "Missing Notifications",
          body:
              "You might have missed some notifications because the app couldn't log in to the ioBroker adapter in time. Please open the app to ensure you receive all notifications.",
          notificationLayout: NotificationLayout.Default,
        ),
      );
    }
  }

  if (service.connectionService.getConnectionStatus() ==
      ConnectionStatus.loggedIn) {
    await NotificationServiceImpl._fetchAndProcessNotifications(
      connection: service.connectionService,
      generalRepository: service.generalRepository,
      notificationRepository: service.notificationRepository,
    );
  } else {
    debugPrint("Failed to login to ioBroker adapter in background handler");
  }
}

class NotificationServiceImpl with WidgetsBindingObserver {
  final SupabaseClient supabase = Supabase.instance.client;
  final NotificationRepository notificationRepository;
  final GeneralRepository generalRepository;
  final ConnectionServiceInterface connectionService;

  final StreamController<void> _notificationStreamController =
      StreamController<void>.broadcast();

  NotificationServiceImpl({
    required this.notificationRepository,
    required this.generalRepository,
    required this.connectionService,
  }) {
    WidgetsBinding.instance.addObserver(this);
    _initAwesomeNotifications();
    unawaited(_tryLoginOnStartup());

    connectionService.connectionStatusStream.listen((status) {
      if (status == ConnectionStatus.loggedIn) {
        _fetchAndProcessNotifications(
          connection: connectionService,
          generalRepository: generalRepository,
          notificationRepository: notificationRepository,
          notificationStreamController: _notificationStreamController,
        );
      }
    });
  }

  void _initAwesomeNotifications() {
    AwesomeNotifications().initialize(
      null, // null for default icon
      [
        NotificationChannel(
          channelKey: 'notification_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notifications from the backend service',
          defaultColor: const Color(0xFF9D50BB),
          ledColor: Colors.white,
          importance: NotificationImportance.Default,
        ),
        NotificationChannel(
          channelKey: 'missing_messages_channel',
          channelName: 'Missing Messages',
          channelDescription:
              'This channel is used to notify the user about missing messages due to login timeout or error',
          defaultColor: const Color(0xFF9D50BB),
          ledColor: Colors.red,
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

  bool _isFirebaseInitialized = false;

  Future<bool> _initFirebaseMessaging() async {
    if (_isFirebaseInitialized) {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        await _registerFCMToken(token);
      }
      return true;
    }

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

          _isFirebaseInitialized = true;
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
    _fetchAndProcessNotifications(
      connection: connectionService,
      generalRepository: generalRepository,
      notificationRepository: notificationRepository,
      notificationStreamController: _notificationStreamController,
    );
  }

  static Future<void> _fetchAndProcessNotifications({
    required ConnectionServiceInterface connection,
    required GeneralRepository generalRepository,
    NotificationRepository? notificationRepository,
    StreamController<void>? notificationStreamController,
  }) async {
    try {
      final client = connection.getGrpcClient<grpc.NotificationServiceClient>();
      if (generalRepository.deviceID == null) return;

      final response = await client.fetchNotifications(
        grpc.FetchNotificationsRequest(deviceId: generalRepository.deviceID),
      );

      final List<String> processedIds = [];

      for (var grpcNotif in response.notifications) {
        final notification = CustomNotification(
          title: grpcNotif.title.isNotEmpty ? grpcNotif.title : "Notification",
          bodyText: grpcNotif.body,
          dateTime: DateTime.fromMillisecondsSinceEpoch(grpcNotif.ts.toInt()),
        );

        notificationRepository?.notificationLog.insert(0, notification);

        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: grpcNotif.id.hashCode,
            channelKey: 'notification_channel',
            title: notification.title,
            body: notification.bodyText,
            notificationLayout: NotificationLayout.Default,
          ),
        );

        processedIds.add(grpcNotif.id);
      }

      if (processedIds.isNotEmpty) {
        notificationRepository?.saveNotificationLog();
        notificationStreamController?.add(null);

        // Acknowledge to backend to clear from queue
        await client.ackNotifications(
          grpc.AckNotificationsRequest(
            deviceId: generalRepository.deviceID,
            notificationIds: processedIds,
          ),
        );
      }
    } catch (e) {
      LoggingService.instance.error(
        "NotificationService | Error fetching notifications via gRPC: $e",
        e,
      );
    }
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
        "NotificationService | login attempt for userUuid: ${userUuid.trim()}@hiob-app.local with password: ${password.trim()}",
      );
      await supabase.auth.signInWithPassword(
        email: "${userUuid.trim()}@hiob-app.local",
        password: password.trim(),
      );
      LoggingService.instance.verbose(
        "NotificationService | signInWithPassword succeeded",
      );

      await updateAuthStatus(NotificationAuthStatus.loggedInAndEnabled);
      LoggingService.instance.verbose(
        "NotificationService | updateAuthStatus succeeded",
      );

      final result = await _initFirebaseMessaging();
      LoggingService.instance.verbose(
        "NotificationService | _initFirebaseMessaging finished with result: $result",
      );

      return result
          ? NotificationAuthStatus.loggedInAndEnabled
          : NotificationAuthStatus.error;
    } catch (e) {
      await updateAuthStatus(NotificationAuthStatus.error);
      LoggingService.instance.error(
        "NotificationService | login error during login: $e",
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
