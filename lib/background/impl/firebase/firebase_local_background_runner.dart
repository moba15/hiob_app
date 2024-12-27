import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/background/background_runner.dart';
import 'package:smart_home/manager/manager.dart';

class FirebaseLocalBackgroundRunner extends BackgroundRunner {
  @override
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    // You may set the permission requests to "provisional" which allows the user to choose what type
    // of notifications they would like to receive once the user receives a notification.
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

    // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {
      Manager().talker.error(
          "FirebaseLocalBackgroundRunner | init | APNS Token not available");
      return;
    }

    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken == null) {
      Manager().talker.error(
          "FirebaseLocalBackgroundRunner | init | fcmToken not available");
    }
    Manager()
        .talker
        .debug("FirebaseLocalBackgroundRunner | init | fcmToken : $fcmToken");

    FirebaseMessaging.instance.onTokenRefresh
        .listen((token) => onTokeRefresh(token))
        .onError((e) => Manager().talker.error(
            "FirebaseLocalBackgroundRunner | onTokenRefresh | error during token refresh $e"));

    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Manager().talker.debug("FirebaseLocalBackgroundRunner | onMessage ");

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @override
  Future<void> logTalker(String msg) async {}

  @override
  Future<bool> shouldStart() {
    // TODO: implement shouldStart
    throw UnimplementedError();
  }

  @override
  Future<void> start() async {}

  @override
  Future<void> stop() async {}

  Future<void> onTokeRefresh(String token) async {}

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }
}
