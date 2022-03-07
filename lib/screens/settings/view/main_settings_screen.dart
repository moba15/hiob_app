
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/screens/settings/view/device_setting_screen.dart';



class MainSettingsScreen extends StatelessWidget {
  final Manager manager;
  const MainSettingsScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: const Icon(Icons.settings),
      ),

      body: ListView(
        children: [
          ListTile(
            title: const Text("Device Settings"),
            leading: const Icon(Icons.device_unknown),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeviceSettingsScreen(manager: manager.deviceManager)),
              )

            },
          )
        ],
      ),
    );
  }
}
