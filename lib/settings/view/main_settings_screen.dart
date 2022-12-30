import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/config_settings/view/config_settings_page.dart';
import 'package:smart_home/settings/general_settings/view/general_settings_page.dart';
import 'package:smart_home/settings/ioBroker_settings/view/iobroker_settings_page.dart';
import 'package:smart_home/settings/view/screen_setting_screen.dart';

import '../widget_settings/widget_template_settings/view/widget_template_list_page.dart';
import 'device_setting_screen.dart';

class MainSettingsScreen extends StatelessWidget {
  final Manager manager;

  const MainSettingsScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: ListView(
        children: [
          ListTile(
            title: const Text("Screen Settings"),
            leading: const Icon(Icons.add_to_home_screen_outlined),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScreenListSettingsScreen(
                        screenManager: manager.screenManager)),
              )
            },
          ),
          ListTile(
            title: const Text("Widget Settings"),
            leading: const Icon(Icons.widgets_outlined),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WidgetTemplateListPage(
                        customWidgetManager: manager.customWidgetManager)),
              )
            },
          ),
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
          ),
          ListTile(
            title: const Text("IoBroker Settings"),
            leading: const Icon(Icons.stream),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  RepositoryProvider.value(value: manager, child: const IoBrokerSettingsPage(),)),
              )
            },
          ),
          ListTile(
            title: const Text("General Settings"),
            leading: const Icon(Icons.settings_rounded),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  RepositoryProvider.value(value: manager, child: const GeneralSettingsPage(),)),
              )
            },
          ),

          ListTile(
            title: const Text("Config Sync (WORK IN PROGRESS)"),
            leading: const Icon(Icons.cloud),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfigSettingsPage()),
              )
            },
          ),


          ListTile(
            title: const Text("License Page"),
            leading: const Icon(Icons.warning_amber_outlined),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              showLicensePage(context: context, applicationName: "HIoB", applicationVersion: "0.1", applicationLegalese: "LICENCE MIT", applicationIcon: const Icon(Icons.smartphone_sharp))
            },
          )
        ],
      ),
    );
  }
}
