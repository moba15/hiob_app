import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
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
      return;
    }
    service = FlutterBackgroundService();
    final ios = IosConfiguration();
    final android = AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      autoStartOnBoot: true,
      isForegroundMode: false,
      foregroundServiceNotificationId:
          NotificationManager.ioBrokerConnectionNotificationId,
      notificationChannelId:
          NotificationManager.ioBrokerConnectionNotificationChannelKey,
      initialNotificationContent: "Not connected",
      initialNotificationTitle: "Connection Status",
    );
    if (Platform.isAndroid) {
      service.configure(iosConfiguration: ios, androidConfiguration: android);
    }
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
    NotificationManager.awesomeNotifications.dismissAllNotifications();
    service.invoke("stop");

    log("Dismiss");
  }

  startService() async {
    if (!Platform.isAndroid) {
      return;
    }
    if (isServiceRunning) {
      return;
    }
    log("Start Background service");
    service.startService();
    isServiceRunning = true;
    final Uri url = await Manager.instance.connectionManager.getUrl();
    NotificationManager.showConnectionNotification(
        "Starting Background service");

    Future.delayed(const Duration(milliseconds: 10))
        .then((value) => service.invoke("start", {
              "url": url.toString(),
              "loginPackage": RequestLoginPackage(
                      deviceName: generalManager.deviceName,
                      deviceID: generalManager.deviceID,
                      key: generalManager.loginKey,
                      password: ioBrokerManager.usePwd
                          ? ioBrokerManager.password
                          : null,
                      user: ioBrokerManager.user,
                      version: Manager.instance.versionNumber)
                  .content
            }));
  }

  static void onStop(ServiceInstance s) {
    s.on("stop").listen((event) {
      s.stopSelf();
    });
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance s) {
    DartPluginRegistrant.ensureInitialized();

    s.on("start").listen((event) async {
      log("Connecting");
      //TODO: Maybe only try in correct wifi to save BatteryLife
      webSocketChannel = IOWebSocketChannel.connect(event!["url"],
          pingInterval: const Duration(minutes: 5)); //TODO Generic
      webSocketChannel!.stream.listen((e) => onData(e, event["loginPackage"]),
          onError: (e) => onError(s), onDone: onDone);
    });
  }

  static void onError(ServiceInstance s) async {
    NotificationManager.showConnectionNotification("Reconnecting...");
    await Future.delayed(const Duration(seconds: 20));
    s.invoke("start");
  }

  static void onData(event, Map<String, dynamic> requestLoginPackage) {
    log("onData");
    Map<String, dynamic> rawMap = jsonDecode(event);
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
      NotificationManager.showIoBNotification(
          jsonDecode(event)["content"]["content"]);
    }
  }

  static void onDone() {
    NotificationManager.showConnectionNotification(
        "Disconnected please open app to connect");
  }
}
