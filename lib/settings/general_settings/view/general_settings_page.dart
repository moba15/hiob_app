import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Settings"),
        actions: [
          IconButton(
            onPressed: () => {Navigator.popUntil(context, (route) => route.isFirst)},
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
          title: const Text("Export"),
          trailing: IconButton(
            icon: const Icon(Icons.import_export),
            onPressed: () => {
              manager.fileManager.export(context),
            },
          ),
          onTap: ()=> {
            manager.fileManager.export(context),
          },
        ),
        ListTile(
            title: const Text("Import"),
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
          builder: (_, setState)  {
            return SwitchListTile(
              value: manager.generalManager.vibrateEnabled,
              onChanged: (v)  {
                setState(()  {
                  manager.generalManager.updateVibrateEnabled(v);
                });
              },
              title: const Text("Extra Vibration"),
            );
          },
        ),
        _DeviceInfo()
      ],
    );
  }
}



class _DeviceInfo extends StatelessWidget {
  const _DeviceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  initialValue: Manager.instance!.androidInfo.model,
                  decoration: const InputDecoration(labelText: "Device Name"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  enabled: false,
                  initialValue: Manager.instance!.androidInfo.id,
                  decoration: const InputDecoration(labelText: "Device ID"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
