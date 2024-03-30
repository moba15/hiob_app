import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class CustomNotification {
  final String? title;
  final String? bodyText;
  final Color? color;
  final int? id;
  final bool group;
  final bool locked;

  CustomNotification(
      {this.title,
      this.bodyText,
      this.color,
      this.id,
      this.group = false,
      this.locked = false});

  factory CustomNotification.fromJSON(Map<String, dynamic> content) {
    Color? color;
    if (content["colorARGB"] != null) {
      color = Color(int.parse(content["colorARGB"], radix: 16));
    }
    int? id = content["id"];
    if (id != null) {
      id += 500;
    }
    return CustomNotification(
        title: content["title"],
        bodyText: content["body"],
        color: color,
        id: id,
        group: content["group"] ?? false,
        locked: content["locked"] ?? false);
  }

  NotificationContent getNotificationContent(
      {required id, required String channelKey, required String groupKey}) {
    return NotificationContent(
        id: this.id ?? id,
        channelKey: channelKey,
        groupKey: group ? groupKey : null,
        title: title,
        body: bodyText,
        color: color,
        locked: locked,
        icon: "");
  }
}
