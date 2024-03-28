import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/custom_notification.dart';
import 'package:smart_home/utils/logger/cutsom_logger.dart';

class NotificationManager with WidgetsBindingObserver {
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  static const String ioBrokerConnectionNotificationChannelKey =
      "ioBroker_connection_notification";
  static const String ioBrokerConnectionNotificationChannelGroupKey =
      "ioBroker_connection_notification_group";
  static const String ioBrokerConnectionNotificationChannelGroupName =
      "IoBroker Connection Notification Group";
  static const String ioBrokerConnectionNotificationChannelName =
      "IoBroker Connection Notification";
  static int ioBrokerConnectionNotificationId = 1;

  static const String ioBrokerNotificationChannelKey = "ioBroker_notification";
  static const String ioBrokerNotificationChannelGroupKey =
      "ioBroker_notification_group";
  static const String ioBrokerNotificationChannelGroupName =
      "IoBroker Notification Group";
  static const String ioBrokerNotificationChannelName = "IoBroker Notification";
  static int ioBrokerNotificationId = 1;

  static bool backgroundNotificationsEnabled = false;

  final FileManager fileManager;
  final String notificationSettingsKey = "notificationsettings";
  NotificationManager({required this.fileManager}) {
    readSettings();
    WidgetsBinding.instance.addObserver(this);
  }

  static void init() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        CustomLogger.logInfoNotification(
            methodname: "permission",
            logMessage: "no permession: asking for permission");
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    CustomLogger.logInfoNotification(
        methodname: "init", logMessage: "before init awesomeNotifications");
    bool init = await awesomeNotifications.initialize(
        'resource://drawable/ic_launcher',
        [
          NotificationChannel(
            channelKey: ioBrokerConnectionNotificationChannelKey,
            channelGroupKey: ioBrokerConnectionNotificationChannelGroupKey,
            channelName: ioBrokerConnectionNotificationChannelName,
            channelDescription: "Displays your connections status",
            defaultColor: const Color(0xffffffff),
            ledColor: Colors.blue,
          ),
          NotificationChannel(
            channelKey: ioBrokerNotificationChannelKey,
            channelGroupKey: ioBrokerNotificationChannelGroupKey,
            channelName: ioBrokerNotificationChannelName,
            channelDescription: "Displays your ioBroker Notifications",
            defaultColor: const Color(0xffffffff),
            ledColor: Colors.blue,
            enableLights: true,
            playSound: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: ioBrokerConnectionNotificationChannelGroupKey,
              channelGroupName: ioBrokerConnectionNotificationChannelGroupName)
        ],
        debug: false);
    CustomLogger.logInfoNotification(
        methodname: "init",
        logMessage: "after init awesomeNotifications ($init)");
  }

  ///Must be all static because of Isolate

  static void showConnectionNotification(String contentraw) {
    CustomLogger.logInfoNotification(
        methodname: "showConnectionNotification",
        logMessage: "before showConnectionNotification");
    awesomeNotifications
        .createNotification(
            content: NotificationContent(
      id: ioBrokerConnectionNotificationId,
      channelKey: ioBrokerConnectionNotificationChannelKey,
      actionType: ActionType.KeepOnTop,
      title: 'HioB Connection Status!',
      body: contentraw,
      locked: true,
    ))
        .then((value) {
      CustomLogger.logInfoNotification(
          methodname: "showConnectionNotification",
          logMessage: "after showConnectionNotification ($value)");
    });
  }

  static void showIoBNotification(String contentraw) {
    ioBrokerNotificationId += 1;
    ioBrokerNotificationId %= 500;
    CustomLogger.logInfoNotification(
        methodname: "showIoBNotification",
        logMessage: "before showIoBNotification");
    try {
      Map<String, dynamic> content = jsonDecode(contentraw);
      _showIoBNotificationMap(content);
    } catch (e) {
      _showIoBNotificationSimple(contentraw);
    }
  }

  static void _showIoBNotificationMap(Map<String, dynamic> content) {
    CustomLogger.logInfoNotification(
        methodname: "_showIoBNotificationMap",
        logMessage: "before _showIoBNotificationMap");
    awesomeNotifications
        .createNotification(
            content:
                CustomNotification.fromJSON(content).getNotificationContent(
      id: ioBrokerNotificationId,
      channelKey: ioBrokerNotificationChannelKey,
      groupKey: ioBrokerNotificationChannelGroupKey,
    ))
        .then((value) {
      CustomLogger.logInfoNotification(
          methodname: "_showIoBNotificationMap",
          logMessage: "after _showIoBNotificationMap ($value)");
    });
  }

  static void _showIoBNotificationSimple(String body) {
    CustomLogger.logInfoNotification(
        methodname: "_showIoBNotificationSimple",
        logMessage: "before _showIoBNotificationSimple");
    awesomeNotifications
        .createNotification(
            content: NotificationContent(
      id: ioBrokerNotificationId,
      channelKey: ioBrokerNotificationChannelKey,
      actionType: ActionType.Default,
      title: 'Notification',
      body: body,
      color: Colors.red,
      groupKey: ioBrokerNotificationChannelGroupKey,
    ))
        .then((value) {
      CustomLogger.logInfoNotification(
          methodname: "_showIoBNotificationSimple",
          logMessage: "after _showIoBNotificationSimple ($value)");
    });
  }

  void readSettings() async {
    Map<String, dynamic>? loadedSettings =
        await fileManager.getMap(notificationSettingsKey);
    if (loadedSettings == null) {
      _loadDefaultSettings();
    } else {
      backgroundNotificationsEnabled =
          loadedSettings["backgroundNotificationsEnabled"];
    }
  }

  void _loadDefaultSettings() {
    _save();
  }

  void _save() {
    Map<String, dynamic> settings = {
      "backgroundNotificationsEnabled": backgroundNotificationsEnabled
    };
    fileManager.writeJSON(notificationSettingsKey, settings);
  }

  void changeBackgroundNotificationsEnabled(
      bool backgroundNotificationsEnabled) {
    NotificationManager.backgroundNotificationsEnabled =
        backgroundNotificationsEnabled;
    _save();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        CustomLogger.logInfoNotification(
            methodname: "didChangeAppLifecycleState",
            logMessage: "App is detached");
        if (backgroundNotificationsEnabled) {
          Manager.instance.backgroundRunner.startService();
        }
        break;
      case AppLifecycleState.inactive:
        CustomLogger.logInfoNotification(
            methodname: "didChangeAppLifecycleState",
            logMessage: "App is inactive");
        if (backgroundNotificationsEnabled) {
          Manager.instance.backgroundRunner.startService();
        }
        break;
      case AppLifecycleState.paused:
        CustomLogger.logInfoNotification(
            methodname: "didChangeAppLifecycleState",
            logMessage: "App is paused $backgroundNotificationsEnabled");
        if (backgroundNotificationsEnabled) {
          Manager.instance.backgroundRunner.startService();
        }
        break;
      case AppLifecycleState.resumed:
        CustomLogger.logInfoNotification(
            methodname: "didChangeAppLifecycleState",
            logMessage: "App is resumed");
        Manager.instance.backgroundRunner.stopService();
        break;
      case AppLifecycleState.hidden:
        if (backgroundNotificationsEnabled) {
          Manager.instance.backgroundRunner.startService();
        }
        break;
    }
  }
}
