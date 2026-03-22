import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

/*
Translation status: 100%
 */
class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getAppLocalizations(context).settings_page_general_settings,
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.popUntil(context, (route) => route.isFirst),
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: const _GeneralSettingsView(),
    );
  }
}

class _GeneralSettingsView extends StatelessWidget {
  const _GeneralSettingsView();

  @override
  Widget build(BuildContext context) {
    FileManager fileManager = context.read<FileManager>();
    GeneralManager generalManager = context.read<GeneralManager>();
    return ListView(
      children: [
        ListTile(
          title: Text(getAppLocalizations(context).export),
          trailing: IconButton(
            icon: const Icon(Icons.import_export),
            onPressed: () => {fileManager.export(context)},
          ),
          onTap: () => {fileManager.export(context)},
        ),
        ListTile(
          title: Text(getAppLocalizations(context).import),
          trailing: IconButton(
            icon: const Icon(Icons.import_export),
            onPressed: () => {context.read<FileManager>().import(context)},
          ),
          onTap: () => {context.read<FileManager>().import(context)},
        ),
        StatefulBuilder(
          builder: (_, setState) {
            return SwitchListTile(
              value: generalManager.vibrateEnabled,
              onChanged: (v) {
                setState(() {
                  generalManager.updateVibrateEnabled(v);
                });
              },
              title: Text(getAppLocalizations(context).vibration),
            );
          },
        ),
        const _DeviceInfo(),
        const _CustomLoggerSettings(),
      ],
    );
  }
}

class _DeviceInfo extends StatelessWidget {
  const _DeviceInfo();

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
                  initialValue: context.read<GeneralManager>().deviceName,
                  decoration: InputDecoration(
                    labelText: getAppLocalizations(context).device_name,
                  ),
                  onChanged: (name) {
                    context.read<GeneralManager>().updateDeviceName(name);
                  },
                ),
              ),
              Container(margin: const EdgeInsets.only(left: 10, right: 5)),
              Expanded(
                flex: 1,
                child: TextFormField(
                  enabled: false,
                  initialValue: context.read<GeneralManager>().deviceID,
                  decoration: InputDecoration(
                    labelText: getAppLocalizations(context).device_id,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomLoggerSettings extends StatefulWidget {
  const _CustomLoggerSettings();

  @override
  State<_CustomLoggerSettings> createState() => __CustomLoggerSettingsState();
}

class __CustomLoggerSettingsState extends State<_CustomLoggerSettings> {
  @override
  Widget build(BuildContext context) {
    final generalManager = context.read<GeneralManager>();
    return Column(
      children: [
        SwitchListTile(
          title: const Text("Enable DebugLogs"),
          onChanged: (value) {
            generalManager.customLoggerFilter.logDebug = value;
            setState(() {
              generalManager.changeCustomLoggerFilter();
            });
          },
          value: generalManager.customLoggerFilter.logDebug,
        ),
        SwitchListTile(
          title: const Text("Enable ErrorLogs"),
          onChanged: (value) {
            generalManager.customLoggerFilter.logError = value;
            setState(() {
              generalManager.changeCustomLoggerFilter();
            });
          },
          value: generalManager.customLoggerFilter.logError,
        ),
        SwitchListTile(
          title: const Text("Enable InfoLogs"),
          onChanged: (value) {
            generalManager.customLoggerFilter.logInfo = value;
            setState(() {
              generalManager.changeCustomLoggerFilter();
            });
          },
          value: generalManager.customLoggerFilter.logInfo,
        ),
        SwitchListTile(
          title: const Text("Enable VerboseLogs"),
          onChanged: (value) {
            generalManager.customLoggerFilter.logVerbose = value;
            setState(() {
              generalManager.changeCustomLoggerFilter();
            });
          },
          value: generalManager.customLoggerFilter.logVerbose,
        ),
      ],
    );
  }
}
