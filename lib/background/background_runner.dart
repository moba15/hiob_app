import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../dataPackages/data_package.dart';

class BackgroundRunner {
  GeneralManager generalManager;
  IoBrokerManager ioBrokerManager;
  late FlutterBackgroundService service;
  static int i = 0;
  static WebSocketChannel? webSocketChannel;

  BackgroundRunner(
      {required this.generalManager, required this.ioBrokerManager});
  init() {
    //NotificationManager.init();

    service = FlutterBackgroundService();
    final ios = IosConfiguration();
    final android = AndroidConfiguration(
        onStart: onStart,
        autoStart: false,
        autoStartOnBoot: false,
        isForegroundMode: true,
        foregroundServiceNotificationId: 999,
        notificationChannelId:
            NotificationManager.ioBrokerNotificationChannelKey,
        initialNotificationContent: "T",
        initialNotificationTitle: "T");
    service.configure(iosConfiguration: ios, androidConfiguration: android);
    //service.startService();

    /* Future.delayed(const Duration(seconds: 10)).then((value) => service.invoke("start",
        {"loginPackage": RequestLoginPackage(
        deviceName: generalManager.deviceName,
        deviceID: generalManager.deviceID,
        key: generalManager.loginKey,
        password: ioBrokerManager.usePwd ? ioBrokerManager.password : null,
        user: ioBrokerManager.user).content}));*/

    i += 10;
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance s) {
    //DartPluginRegistrant.ensureInitialized();

    s.on("start").listen((event) {
      log("Connecting");
      //TODO: Handle Failed Connect: For example wait a few seconds and try again
      //TODO: Maybe only try in correct wifi to save BatteryLife
      webSocketChannel =
          IOWebSocketChannel.connect("ws://192.168.178.96:8090"); //TODO Generic
      webSocketChannel!.stream.listen((e) => onData(e, event!["loginPackage"]),
          onError: (e) {
        throw const SocketException("");
      }, onDone: onDone);
    });
  }

  static void onData(event, Map<String, dynamic> requestLoginPackage) {
    //TODO: Send Data to clarify intend (only notification)
    //TODO: Rec Notifications
    Map<String, dynamic> rawMap = jsonDecode(event);
    DataPackageType packageType = DataPackageType.values
        .firstWhere((element) => element.name == rawMap["type"]);
    //TODO Handle Failed Login
    if (packageType == DataPackageType.firstPingFromIob2 ||
        packageType == DataPackageType.firstPingFromIob) {
      //TODO: Login
      webSocketChannel?.sink.add(jsonEncode({
        "type": DataPackageType.requestLogin.name,
        "content": requestLoginPackage
      }));
    } else if (packageType == DataPackageType.loginApproved) {
      //TODO: Send Data to clarify intend (only notification)
      webSocketChannel?.sink.add(jsonEncode({
        "type": DataPackageType.notification.name,
        "content": {"onlySendNotification": true}
      }));
    } else if (packageType == DataPackageType.notification) {
      //TODO: Show Beatiful Notification!
      NotificationManager.showNotification(event);
    }
  }

  static void onDone() {}
}
