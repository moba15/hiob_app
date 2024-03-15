import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationManager {
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

  static void init() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().initialize(
        null,
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
        debug: true);
  }

  ///Must be all static because of Isolate

  static void showConnectionNotification(String contentraw) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: ioBrokerConnectionNotificationId,
      channelKey: ioBrokerConnectionNotificationChannelKey,
      actionType: ActionType.KeepOnTop,
      title: 'HioB Connection Status!',
      body: contentraw,
    ));
  }

  static void showIoBNotification(String contentraw) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: ioBrokerNotificationId,
      channelKey: ioBrokerNotificationChannelKey,
      actionType: ActionType.Default,
      title: 'Notification',
      body: contentraw,
      color: Colors.red,
    ));
  }
}
