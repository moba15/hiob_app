import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/background/background_runner.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import 'package:smart_home/utils/logger/cutsom_logger.dart';
import 'package:smart_home/utils/widgets/divider/divider_with_text.dart';

/*
Translation status: 100%
 */
class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(getAppLocalizations(context).settings_page_general_settings),
        actions: [
          IconButton(
            onPressed: () =>
                {Navigator.popUntil(context, (route) => route.isFirst)},
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: const _GeneralSettingsView(),
    );
  }
}

class _GeneralSettingsView extends StatelessWidget {
  const _GeneralSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Manager manager = context.read<Manager>();
    return ListView(
      children: [
        ListTile(
          title: Text(getAppLocalizations(context).export),
          trailing: IconButton(
            icon: const Icon(Icons.import_export),
            onPressed: () => {
              manager.fileManager.export(context),
            },
          ),
          onTap: () => {
            manager.fileManager.export(context),
          },
        ),
        ListTile(
          title: Text(getAppLocalizations(context).import),
          trailing: IconButton(
            icon: const Icon(Icons.import_export),
            onPressed: () => {
              context.read<Manager>().fileManager.import(context),
            },
          ),
          onTap: () => {
            context.read<Manager>().fileManager.import(context),
          },
        ),
        StatefulBuilder(
          builder: (_, setState) {
            return SwitchListTile(
              value: manager.generalManager.vibrateEnabled,
              onChanged: (v) {
                setState(() {
                  manager.generalManager.updateVibrateEnabled(v);
                });
              },
              title: Text(getAppLocalizations(context).vibration),
            );
          },
        ),
        const DividerWithText(text: Text("Divice info")),
        const _DeviceInfo(),
        const DividerWithText(text: Text("Background Notifications")),
        const _BackgroundNotificationSettings(),
        const DividerWithText(text: Text("Logger")),
        const _CustomLoggerSettings(),
      ],
    );
  }
}

class _DeviceInfo extends StatelessWidget {
  const _DeviceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  enabled: false,
                  initialValue: Manager.instance.generalManager.deviceName,
                  decoration: InputDecoration(
                      labelText: getAppLocalizations(context).device_name),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  enabled: false,
                  initialValue: Manager.instance.generalManager.deviceID,
                  decoration: InputDecoration(
                      labelText: getAppLocalizations(context).device_id),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _CustomLoggerSettings extends StatefulWidget {
  const _CustomLoggerSettings({Key? key}) : super(key: key);

  @override
  State<_CustomLoggerSettings> createState() => __CustomLoggerSettingsState();
}

class __CustomLoggerSettingsState extends State<_CustomLoggerSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text("Enable DebugLogs"),
          onChanged: (value) {
            Manager().generalManager.customLoggerFilter.logDebug = value;
            setState(() {
              Manager().generalManager.changeCustomLoggerFilter();
            });
          },
          value: Manager().generalManager.customLoggerFilter.logDebug,
        ),
        SwitchListTile(
          title: const Text("Enable ErrorLogs"),
          onChanged: (value) {
            Manager().generalManager.customLoggerFilter.logError = value;
            setState(() {
              Manager().generalManager.changeCustomLoggerFilter();
            });
          },
          value: Manager().generalManager.customLoggerFilter.logError,
        ),
        SwitchListTile(
          title: const Text("Enable InfoLogs"),
          onChanged: (value) {
            Manager().generalManager.customLoggerFilter.logInfo = value;
            setState(() {
              Manager().generalManager.changeCustomLoggerFilter();
            });
          },
          value: Manager().generalManager.customLoggerFilter.logInfo,
        ),
        SwitchListTile(
          title: const Text("Enable VerboseLogs"),
          onChanged: (value) {
            Manager().generalManager.customLoggerFilter.logVerbose = value;
            setState(() {
              Manager().generalManager.changeCustomLoggerFilter();
            });
          },
          value: Manager().generalManager.customLoggerFilter.logVerbose,
        ),
      ],
    );
  }
}

class _BackgroundNotificationSettings extends StatefulWidget {
  const _BackgroundNotificationSettings({Key? key}) : super(key: key);

  @override
  State<_BackgroundNotificationSettings> createState() =>
      __BackgroundNotificationSettingsState();
}

class __BackgroundNotificationSettingsState
    extends State<_BackgroundNotificationSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<BackgroundRunnerStrategy>(
          value: Manager().generalManager.backgroundRunnerStrategy,
          items: BackgroundRunnerStrategy.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              Manager().generalManager.setBackgroundStrategy(
                  value ?? BackgroundRunnerStrategy.disabled);
            });
          },
        )
      ],
    );
  }
}
