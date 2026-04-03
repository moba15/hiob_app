import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class CustomNotification {
  final String? title;
  final String? bodyText;
  final Color? color;
  final int? id;
  final bool group;
  final bool locked;

  bool read;

  DateTime? dateTime;

  CustomNotification({
    this.title,
    this.bodyText,
    this.color,
    this.id,
    this.group = false,
    this.locked = false,
    this.dateTime,
    this.read = false,
  }) {
    dateTime ??= DateTime.now();
  }

  factory CustomNotification.fromJSON(Map<String, dynamic> content) {
    Color? color;
    if (content["colorARGB"] != null) {
      color = Color(int.parse(content["colorARGB"], radix: 16));
    }
    int? id = content["id"];
    if (id != null) {
      id += 500;
    }
    DateTime? dateTime;
    if (content["dateTime"] != null) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(content["dateTime"]);
    }
    return CustomNotification(
      title: content["title"],
      bodyText: content["body"],
      color: color,
      id: id,
      group: content["group"] ?? false,
      locked: content["locked"] ?? false,
      dateTime: dateTime,
      read: content["read"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "body": bodyText,
      "group": group,
      "dateTime": dateTime?.millisecondsSinceEpoch,
      "read": read,
    };
  }

  NotificationContent getNotificationContent({
    required id,
    required String channelKey,
    required String groupKey,
  }) {
    return NotificationContent(
      id: this.id ?? id,
      channelKey: channelKey,
      groupKey: group ? groupKey : null,
      title: title,
      body: bodyText,
      color: color,
      locked: locked,
      icon: "",
    );
  }

  Widget getDateWidget() {
    if (dateTime == null) {
      return const Text("No Time");
    }

    DateTime today = DateTime.now();
    if (today.year != dateTime!.year ||
        today.day != dateTime!.day ||
        today.month != dateTime!.month) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${dateTime!.day}.${dateTime!.month}.${dateTime!.year}",
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            "${dateTime!.hour}:${dateTime!.minute < 10 ? ('0${dateTime!.minute}') : dateTime!.minute}:${dateTime!.second < 10 ? ('0${dateTime!.second}') : dateTime!.second}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      );
    }

    return Text(
      "${dateTime!.hour}:${dateTime!.minute < 10 ? ('0${dateTime!.minute}') : dateTime!.minute}:${dateTime!.second < 10 ? ('0${dateTime!.second}') : dateTime!.second}",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}
