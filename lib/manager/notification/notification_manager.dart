import 'dart:async';
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/custom_notification.dart';
import 'package:smart_home/utils/logger/cutsom_logger.dart';

/// TODO Implement Implenation pattern to differnetiate between Background and Foreground (possible?)
class NotificationManager with WidgetsBindingObserver {
  static SharedPreferences? staticSharedPreferences;
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

  static List<CustomNotification> notificationsLog = [];

  final FileManager fileManager;
  final String notificationSettingsKey = "notificationsettings";
  final StreamController _notificationStreamController =
      StreamController.broadcast();
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
              playSound: false),
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
              channelGroupName: ioBrokerConnectionNotificationChannelGroupName),
          NotificationChannelGroup(
              channelGroupKey: ioBrokerNotificationChannelGroupKey,
              channelGroupName: ioBrokerNotificationChannelGroupName)
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
                actionType: ActionType.Default,
                title: 'HioB Connection Status!',
                body: contentraw,
                locked: true,
                criticalAlert: false))
        .then((value) {
      CustomLogger.logInfoNotification(
          methodname: "showConnectionNotification",
          logMessage: "after showConnectionNotification ($value)");
    });
  }

  static void showIoBNotificationInBackground(String contentraw) {
    ioBrokerNotificationId += 1;
    ioBrokerNotificationId %= 500;
    CustomLogger.logInfoNotification(
        methodname: "showIoBNotification",
        logMessage: "before showIoBNotification");
    try {
      Map<String, dynamic> content = jsonDecode(contentraw);
      _showIoBCustomNotification(CustomNotification.fromJSON(content));
      addNotificationToLogInBackground(CustomNotification.fromJSON(content));
    } catch (e) {
      _showIoBNotificationSimple(contentraw);
      addNotificationToLogInBackground(
          CustomNotification(title: "Notification", bodyText: contentraw));
    }
  }

  static void _showIoBCustomNotification(
      CustomNotification customNotification) {
    CustomLogger.logInfoNotification(
        methodname: "_showIoBNotificationMap",
        logMessage: "before _showIoBNotificationMap");
    awesomeNotifications
        .createNotification(
            content: customNotification.getNotificationContent(
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

  static void addNotificationToLogInBackground(
      CustomNotification customNotification) async {
    //Save to file
    staticSharedPreferences ??= await SharedPreferences.getInstance();
    List<dynamic> logs = (jsonDecode(
            staticSharedPreferences?.getString("notificationsettings") ?? "{}")
        as Map<String, dynamic>)["notificationsLog"];
    logs.add(customNotification.toJson());
    Map<String, dynamic> settings = {
      "backgroundNotificationsEnabled": true,
      "notificationsLog": logs
    };
    notificationsLog.clear();
    await staticSharedPreferences?.setString(
        "notificationsettings", jsonEncode(settings));
  }

  void readSettings() async {
    await fileManager.reload();
    Map<String, dynamic>? loadedSettings =
        await fileManager.getMap(notificationSettingsKey);

    if (loadedSettings == null) {
      _loadDefaultSettings();
    } else {
      notificationsLog.clear();
      backgroundNotificationsEnabled =
          loadedSettings["backgroundNotificationsEnabled"];
      for (Map<String, dynamic> customNotificationRaw
          in loadedSettings["notificationsLog"]) {
        notificationsLog
            .add(CustomNotification.fromJSON(customNotificationRaw));
        _notificationStreamController
            .add(CustomNotification.fromJSON(customNotificationRaw));
      }
    }
  }

  void _loadDefaultSettings() {
    _save();
  }

  void _save() {
    Map<String, dynamic> settings = {
      "backgroundNotificationsEnabled": backgroundNotificationsEnabled,
      "notificationsLog": notificationsLog
    };
    fileManager.writeJSON(notificationSettingsKey, settings);
  }

  void changeBackgroundNotificationsEnabled(
      bool backgroundNotificationsEnabled) {
    NotificationManager.backgroundNotificationsEnabled =
        backgroundNotificationsEnabled;
    _save();
  }

  Stream get notificationStream {
    return _notificationStreamController.stream;
  }

  void showIoBNotificationInForeground(String contentraw) {
    ioBrokerNotificationId += 1;
    ioBrokerNotificationId %= 500;
    CustomLogger.logInfoNotification(
        methodname: "showIoBNotification",
        logMessage: "before showIoBNotification");
    try {
      Map<String, dynamic> content = jsonDecode(contentraw);
      CustomNotification customNotification =
          CustomNotification.fromJSON(content);
      _showIoBCustomNotification(customNotification);
      addNotificationToLogInForeground(customNotification);
    } catch (e) {
      _showIoBNotificationSimple(contentraw);
      addNotificationToLogInForeground(
          CustomNotification(title: "Notification", bodyText: contentraw));
    }
  }

  static void addNotificationToLogInForeground(
      CustomNotification customNotification) {
    notificationsLog.add(customNotification);
    Manager.instance.notificationManager._save();
    Manager.instance.notificationManager._notificationStreamController
        .add(customNotification);
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
        readSettings();
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  void removeNotificationLog({required int index}) {
    notificationsLog.removeAt(index);
    _save();
  }

  void readAllNotifications() {
    for (var element in notificationsLog) {
      element.read = true;
    }
    _save();
    _notificationStreamController.add(0);
  }

  void deletAllNotifications() {
    notificationsLog.clear();
    _save();
  }

  int get unreadNotifications {
    return notificationsLog.where((element) => !element.read).length;
  }
}
