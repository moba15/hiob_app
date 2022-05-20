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
        )
      ],
    );
  }
}
