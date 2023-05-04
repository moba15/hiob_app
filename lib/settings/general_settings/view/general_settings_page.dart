import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
/*
Translation status: 100%
 */
class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getAppLocalizations(context).settings_page_general_settings),
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
        const _DeviceInfo()
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
                  initialValue: Manager.instance!.androidInfo.model,
                  decoration: InputDecoration(labelText: getAppLocalizations(context).device_name),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  enabled: false,
                  initialValue: Manager.instance!.androidInfo.id,
                  decoration: InputDecoration(labelText: getAppLocalizations(context).device_id),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
