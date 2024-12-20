import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:smart_home/main.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/utils/logger/cutsom_logger.dart';
import 'package:talker/talker.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../dataPackages/data_package.dart';

class BackgroundRunner {
  static int i = 0;
  static WebSocketChannel? webSocketChannel;
  static int reconnectTries = 0;
  static int maxReconnectTries = 60;

  GeneralManager generalManager;
  IoBrokerManager ioBrokerManager;
  Talker? talker;
  static late FlutterBackgroundService service;
  bool isServiceRunning = false;

  BackgroundRunner(
      {required this.generalManager, required this.ioBrokerManager});
  init() {
    NotificationManager.init();
    if (!Platform.isAndroid) {
      log("Platfrom is not Android -> disabled Background runner", level: 1);
      Manager()
          .talker
          .info("Backgroundrunner | init | not supported on this platform");
      return;
    }
    log("OK");
    talker = Manager().talker;
    talker?.info("Backgroundrunner | init");
    service = FlutterBackgroundService();
    final ios = IosConfiguration();
    final android = AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      autoStartOnBoot: true,
      isForegroundMode: true,
      foregroundServiceNotificationId:
          NotificationManager.ioBrokerConnectionNotificationId,
      notificationChannelId:
          NotificationManager.ioBrokerConnectionNotificationChannelKey,
      initialNotificationContent: "Paused",
      initialNotificationTitle: "Connection Status",
    );
    service.configure(iosConfiguration: ios, androidConfiguration: android);
    talker?.info("Backgroundrunner | init | Service configured");
  }

  stopService() {
    if (!Platform.isAndroid) {
      return;
    }
    isServiceRunning = false;
    log("Stop Background service");
    talker?.log("Backgroundrunner | stopservice");

    NotificationManager.awesomeNotifications
        .dismiss(NotificationManager.ioBrokerConnectionNotificationId);
    NotificationManager.awesomeNotifications.dismissNotificationsByChannelKey(
        NotificationManager.ioBrokerConnectionNotificationChannelKey);
    service.invoke("stop");
  }

  startService() async {
    if (!Platform.isAndroid) {
      return;
    }
    talker?.info("Backgroundrunner | startService");

    if (isServiceRunning) {
      talker?.debug("Backgroundrunner | startService | already running");
      return;
    }
    await service.startService();
    isServiceRunning = true;
    final Uri url = await Manager.instance.connectionManager.getUrl();
    talker?.debug("Backgroundrunner | startService  | invokeStart");

    service.invoke("start", {
      "url": url.toString(),
      "loginPackage": RequestLoginPackage(
              deviceName: generalManager.deviceName,
              deviceID: generalManager.deviceID,
              key: generalManager.loginKey,
              password:
                  ioBrokerManager.usePwd ? ioBrokerManager.password : null,
              user: ioBrokerManager.user,
              version: Manager.instance.versionNumber)
          .content,
      "secureKey": ioBrokerManager.secureKey,
      "aes_enabled": ioBrokerManager.secureBox,
    });
  }

  static void onStop(ServiceInstance s) {
    webSocketChannel?.sink.close();
    s.stopSelf();
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance s) {
    DartPluginRegistrant.ensureInitialized();

    s.on("start").listen((event) async {
      connect(event, s);
    });

    s.on("stop").listen((event) {
      onStop(s);
    });
  }

  static void connect(Map<String, dynamic>? event, ServiceInstance s) {
    Talker().debug("Background | connect");
    HttpOverrides.global = MyHttpOverrides();
    log("event: ${jsonEncode(event)}");

    webSocketChannel = IOWebSocketChannel.connect(event!["url"],
        pingInterval: const Duration(seconds: 5));

    webSocketChannel!.stream.listen(
        (e) => onData(
            e, event["loginPackage"], event["aes_enabled"], event["secureKey"]),
        onError: (e) => onError(s, e),
        onDone: () => onDone(s, event));
  }

  static void onError(ServiceInstance s, dynamic e) async {
    if (reconnectTries >= maxReconnectTries) {
      s.stopSelf();
      s.invoke("stop");
      NotificationManager.showConnectionNotification("Connection stopped");
      return;
    }
    reconnectTries++;
    NotificationManager.showConnectionNotification("Reconnecting...");
    Talker().error("Background | error");

    await Future.delayed(const Duration(seconds: 5));
    s.invoke("start");
  }

  static void onData(event, Map<String, dynamic> requestLoginPackage,
      bool aesEnabled, String secureKey) {
    CustomLogger.logInfoBackgroundRunner(
        methodname: "onData", logMessage: "Service got data");
    CustomLogger.logInfoBackgroundRunner(
        methodname: "onData", logMessage: "Service got data $event");
    Map<String, dynamic> rawMap = jsonDecode(event);
    if (aesEnabled) {
      event =
          ConnectionManager.decryptAes(rawMap: rawMap, secureKey: secureKey);
      CustomLogger.logInfoBackgroundRunner(
          methodname: "onData", logMessage: "Decrypt data");
    }

    DataPackageType packageType = DataPackageType.values
        .firstWhere((element) => element.name == rawMap["type"]);

    if (packageType == DataPackageType.firstPingFromIob2 ||
        packageType == DataPackageType.firstPingFromIob) {
      webSocketChannel?.sink.add(jsonEncode({
        "type": DataPackageType.requestLogin.name,
        "content": requestLoginPackage
      }));
    } else if (packageType == DataPackageType.loginApproved) {
      webSocketChannel?.sink.add(jsonEncode({
        "type": DataPackageType.notification.name,
        "content": {"onlySendNotification": true}
      }));
      NotificationManager.showConnectionNotification("Connected");
    } else if (packageType == DataPackageType.loginDeclined) {
      NotificationManager.showConnectionNotification(
          "Failed to login please open the app");
    } else if (packageType == DataPackageType.notification) {
      //TODO Create class
      NotificationManager.showIoBNotificationInBackground(
          (rawMap["content"]["content"]));
    }
  }

  static void onDone(ServiceInstance s, Map<String, dynamic>? event) async {
    Talker().error("Background | onDone");
    NotificationManager.showConnectionNotification(
        "Disconnected please open app to connect");
    if (reconnectTries > maxReconnectTries) {
      s.stopSelf();
      s.invoke("stop");
      return;
    }
    reconnectTries++;
    NotificationManager.showConnectionNotification("Reconnecting in 5sec");
    await Future.delayed(const Duration(seconds: 5));
    NotificationManager.showConnectionNotification("Reconnecting...");
    connect(event, s);
  }
}

extension TalkerLogJson on TalkerLog {}
