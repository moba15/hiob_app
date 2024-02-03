
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';


class NotificationManager {
  static const String ioBrokerNotificationChannelKey = "ioBroker_notification";
  static const String ioBrokerNotificationChannelGroupKey = "ioBroker_notification_group";
  static const String ioBrokerNotificationChannelGroupName = "IoBroker Notification Group";
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
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: ioBrokerNotificationChannelKey,
        channelGroupKey: ioBrokerNotificationChannelGroupKey,
        channelName: ioBrokerNotificationChannelName,
        channelDescription: "Notifications from your ioBroker",
        defaultColor: const Color(0xffffffff),
        ledColor: Colors.blue,
        
        
      ),
    ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: ioBrokerNotificationChannelGroupKey,
          channelGroupName: ioBrokerNotificationChannelGroupName
        )
      ],
        debug: true
    );
  }
  
  ///Must be all static because of Isolate
  
  
  static void showNotification(String contentraw) {
    ioBrokerNotificationId++;
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: ioBrokerNotificationId,
          channelKey: ioBrokerNotificationChannelKey,
          actionType: ActionType.Default,
          title: 'Hello World!',
          body: 'This is my first notification!',
        )
    );


    
  }
  
  

}