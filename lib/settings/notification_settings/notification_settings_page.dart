import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: const _NotificationSettingsBody(),
    );
  }
}

class _NotificationSettingsBody extends StatefulWidget {
  const _NotificationSettingsBody({Key? key}) : super(key: key);

  @override
  State<_NotificationSettingsBody> createState() =>
      __NotificationSettingsBodyState();
}

class __NotificationSettingsBodyState extends State<_NotificationSettingsBody> {
  @override
  Widget build(BuildContext context) {
    NotificationManager notificationManager =
        context.read<Manager>().notificationManager;
    return SwitchListTile(
        value: NotificationManager.backgroundNotificationsEnabled,
        title: Text(getAppLocalizations(context).background_notifications),
        onChanged: (value) => setState(() =>
            notificationManager.changeBackgroundNotificationsEnabled(value)));
  }
}
