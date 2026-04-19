import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/repository/notification_repository.dart';
import 'package:smart_home/settings/notification_settings/cubit/notification_auth_cubit.dart';
import 'package:smart_home/services/impl/iobroker/notification_service.dart';
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
      appBar: AppBar(title: const Text("Notifications")),
      body: BlocProvider(
        create: (context) => NotificationAuthCubit(
          notificationService: context.read<NotificationServiceImpl>(),
        ),
        child: const _NotificationSettingsBody(),
      ),
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
  final TextEditingController _uuidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStoredSettings();
  }

  Future<void> _loadStoredSettings() async {
    final NotificationServiceImpl service = context
        .read<NotificationServiceImpl>();
    _uuidController.text = service.userUuid;
    _passwordController.text = await service.getPassword();

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _uuidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _dummyStatusLabel(NotificationAuthStatus status) {
    switch (status) {
      case NotificationAuthStatus.loggedOut:
        return "Logged out";
      case NotificationAuthStatus.loggedInAndEnabled:
        return "Logged in and enabled";
      case NotificationAuthStatus.error:
        return "Error";
    }
  }

  Color _dummyStatusColor(NotificationAuthStatus status) {
    switch (status) {
      case NotificationAuthStatus.loggedOut:
        return const Color.fromARGB(255, 224, 224, 224);
      case NotificationAuthStatus.loggedInAndEnabled:
        return const Color.fromARGB(255, 200, 230, 201);
      case NotificationAuthStatus.error:
        return const Color.fromARGB(255, 255, 205, 210);
    }
  }

  Color _dummyStatusForegroundColor(NotificationAuthStatus status) {
    switch (status) {
      case NotificationAuthStatus.loggedOut:
        return const Color.fromARGB(255, 66, 66, 66);
      case NotificationAuthStatus.loggedInAndEnabled:
        return const Color.fromARGB(255, 27, 94, 32);
      case NotificationAuthStatus.error:
        return const Color.fromARGB(255, 183, 28, 28);
    }
  }

  IconData _dummyStatusIcon(NotificationAuthStatus status) {
    switch (status) {
      case NotificationAuthStatus.loggedOut:
        return Icons.logout;
      case NotificationAuthStatus.loggedInAndEnabled:
        return Icons.check_circle;
      case NotificationAuthStatus.error:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final NotificationServiceImpl notificationManager = context
        .read<NotificationServiceImpl>();
    final NotificationAuthCubit authCubit = context
        .read<NotificationAuthCubit>();
    final bool notificationsEnabled =
        notificationManager.backgroundNotificationsEnabled;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: notificationsEnabled,
          title: Text(getAppLocalizations(context).background_notifications),
          onChanged: (value) async {
            await authCubit.onNotificationsToggle(value);
            if (!mounted) {
              return;
            }
            setState(() {});
            if (value) {
              showDialog(
                context: context,
                builder: (context) => const _InfoAlertDialog(),
              );
            }
          },
        ),
        if (notificationsEnabled) ...[
          const SizedBox(height: 12),
          TextField(
            controller: _uuidController,
            decoration: const InputDecoration(
              labelText: "User UUID",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) async {
              await authCubit.onCredentialsChanged(
                userUuid: value,
                password: _passwordController.text,
              );
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) async {
              await authCubit.onCredentialsChanged(
                userUuid: _uuidController.text,
                password: value,
              );
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                await authCubit.login(
                  userUuid: _uuidController.text,
                  password: _passwordController.text,
                );
              },
              icon: const Icon(Icons.login),
              label: const Text("Login"),
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<NotificationAuthCubit, NotificationAuthStatus>(
            builder: (context, status) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: _dummyStatusColor(status),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      _dummyStatusIcon(status),
                      size: 18,
                      color: _dummyStatusForegroundColor(status),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Status: ${_dummyStatusLabel(status)}",
                      style: TextStyle(
                        color: _dummyStatusForegroundColor(status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ],
    );
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
        style: TextStyle(color: Color.fromARGB(255, 244, 67, 54)),
      ),
      content: RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: "This a ", style: TextStyle(fontSize: 25)),
            const TextSpan(
              text: "beta",
              style: TextStyle(
                color: Color.fromARGB(255, 76, 175, 80),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const TextSpan(text: " feature!", style: TextStyle(fontSize: 25)),
            const TextSpan(
              text: "Please read the ",
              style: TextStyle(fontSize: 25),
            ),
            TextSpan(
              text: "docs",
              style: const TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 33, 150, 243),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(
                    Uri.https(
                      "github.com",
                      "/moba15/ioBroker.hiob/tree/development/docs",
                    ),
                  );
                },
            ),
            const TextSpan(text: "."),
            TextSpan(
              text:
                  "\nhttps://github.com/moba15/ioBroker.hiob/tree/development/docs\n\n",
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 33, 150, 243),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(
                    Uri.https(
                      "github.com",
                      "/moba15/ioBroker.hiob/tree/development/docs",
                    ),
                  );
                },
            ),
            const TextSpan(
              text: "\nYou need minimum Adapter version:\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const TextSpan(
              text: "0.0.66-beta.0",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 255, 152, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
