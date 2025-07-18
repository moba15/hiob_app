import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const _NotificationSettingsBody(),
    );
  }
}

class _NotificationSettingsBody extends StatefulWidget {
  const _NotificationSettingsBody();

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
        onChanged: (value) => setState(() {
              notificationManager.changeBackgroundNotificationsEnabled(value);
              if (value) {
                showDialog(
                  context: context,
                  builder: (context) => const _InfoAlertDialog(),
                );
              }
            }));
  }
}

class _InfoAlertDialog extends StatelessWidget {
  const _InfoAlertDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: const Icon(Icons.info),
        title: const Text(
          "Important",
          style: TextStyle(color: Colors.red),
        ),
        content: RichText(
          text: TextSpan(children: [
            const TextSpan(text: "This a ", style: TextStyle(fontSize: 25)),
            const TextSpan(
                text: "beta",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            const TextSpan(text: " feature!", style: TextStyle(fontSize: 25)),
            const TextSpan(
                text: "Please read the ", style: TextStyle(fontSize: 25)),
            TextSpan(
                text: "docs",
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.https("github.com",
                        "/moba15/ioBroker.hiob/tree/development/docs"));
                  }),
            const TextSpan(text: "."),
            TextSpan(
                text:
                    "\nhttps://github.com/moba15/ioBroker.hiob/tree/development/docs\n\n",
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.https("github.com",
                        "/moba15/ioBroker.hiob/tree/development/docs"));
                  }),
            const TextSpan(
                text: "\nYou need minimum Adapter version:\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            const TextSpan(
                text: "0.0.66-beta.0",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                ))
          ]),
        ));
  }
}
