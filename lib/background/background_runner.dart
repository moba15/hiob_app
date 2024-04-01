import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/utils/logger/cutsom_logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../dataPackages/data_package.dart';

class BackgroundRunner {
  static int i = 0;
  static WebSocketChannel? webSocketChannel;

  GeneralManager generalManager;
  IoBrokerManager ioBrokerManager;
  late FlutterBackgroundService service;
  bool isServiceRunning = false;

  BackgroundRunner(
      {required this.generalManager, required this.ioBrokerManager});
  init() {
    NotificationManager.init();
    if (!Platform.isAndroid) {
      log("Platfrom is not Android -> disabled Background runner", level: 1);
      CustomLogger.logInfoBackgroundRunner(
          methodname: "init", logMessage: "Is not Android");
      return;
    }

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
    CustomLogger.logInfoBackgroundRunner(
        methodname: "init", logMessage: "Service configurated");
    log("init");
  }

  stopService() {
    if (!Platform.isAndroid) {
      return;
    }
    isServiceRunning = false;
    log("Stop Background service");

    NotificationManager.awesomeNotifications
        .dismiss(NotificationManager.ioBrokerConnectionNotificationId);
    NotificationManager.awesomeNotifications.dismissNotificationsByChannelKey(
        NotificationManager.ioBrokerConnectionNotificationChannelKey);
    CustomLogger.logInfoBackgroundRunner(
        methodname: "stopService", logMessage: "Invoking stop");
    service.invoke("stop");
  }

  startService() async {
    if (!Platform.isAndroid) {
      return;
    }
    if (isServiceRunning) {
      return;
    }
    CustomLogger.logInfoBackgroundRunner(
        methodname: "startService", logMessage: "Service is starting...");
    log("Start Background service");
    await service.startService();
    isServiceRunning = true;
    final Uri url = await Manager.instance.connectionManager.getUrl();
    NotificationManager.showConnectionNotification(
        "Starting Background service");

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
    CustomLogger.logInfoBackgroundRunner(
        methodname: "onStop", logMessage: "Stop invoked");
    webSocketChannel?.sink.close();
    s.stopSelf();
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance s) {
    DartPluginRegistrant.ensureInitialized();

    s.on("start").listen((event) async {
      log("event: " + jsonEncode(event));
      CustomLogger.logInfoBackgroundRunner(
          methodname: "onStart", logMessage: "Service is connecting to server");
      webSocketChannel = IOWebSocketChannel.connect(event!["url"],
          pingInterval: const Duration(seconds: 10));

      webSocketChannel!.stream.listen(
          (e) => onData(e, event["loginPackage"], event!["aes_enabled"],
              event!["secureKey"]),
          onError: (e) => onError(s, e),
          onDone: onDone);
    });

    s.on("stop").listen((event) {
      onStop(s);
    });
  }

  static void onError(ServiceInstance s, dynamic e) async {
    NotificationManager.showConnectionNotification("Reconnecting...");
    await Future.delayed(const Duration(seconds: 20));
    s.invoke("start");
  }

  static void onData(event, Map<String, dynamic> requestLoginPackage,
      bool aes_enabled, String secureKey) {
    CustomLogger.logInfoBackgroundRunner(
        methodname: "onData", logMessage: "Service got data");
    CustomLogger.logInfoBackgroundRunner(
        methodname: "onData", logMessage: "Service got data $event");
    Map<String, dynamic> rawMap = jsonDecode(event);
    if (aes_enabled) {
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

  static void onDone() {
    CustomLogger.logInfoBackgroundRunner(
        methodname: "onDone", logMessage: "Done connection");
    NotificationManager.showConnectionNotification(
        "Disconnected please open app to connect");
  }
}
