import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/custom_theme/settings/custom_theme_settings_page.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/config_settings/view/config_settings_page.dart';
import 'package:smart_home/settings/general_settings/view/general_settings_page.dart';
import 'package:smart_home/settings/ioBroker_settings/view/iobroker_settings_page.dart';
import 'package:smart_home/settings/view/screen_setting_screen.dart';

import '../widget_settings/widget_template_settings/view/widget_template_list_page.dart';
import 'device_setting_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            title: Text(AppLocalizations.of(context)!.settings_page_screen_setting),
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
            title: Text(AppLocalizations.of(context)!.settings_page_widget_setting),
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
            title: Text(AppLocalizations.of(context)!.settings_page_device_setting),
            leading: const Icon(Icons.device_unknown),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DeviceSettingsScreen(manager: manager.deviceManager)),
              )
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settings_page_iobroker_settings),
            leading: const Icon(Icons.stream),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RepositoryProvider.value(
                          value: manager,
                          child: const IoBrokerSettingsPage(),
                        )),
              )
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settings_page_general_settings),
            leading: const Icon(Icons.settings_rounded),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RepositoryProvider.value(
                          value: manager,
                          child: const GeneralSettingsPage(),
                        )),
              )
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settings_page_config_sync),
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
            title: Text(AppLocalizations.of(context)!.custom_theme_settings_page_title),
            leading: const Icon(Icons.color_lens),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomThemeSettingsPage()),
              )
            },
          ),
          ListTile(
            title: const Text("License Page"),
            leading: const Icon(Icons.warning_amber_outlined),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {
              showLicensePage(
                  context: context,
                  applicationName: "HIoB",
                  applicationVersion: "0.4",
                  applicationLegalese: "LICENCE MIT",
                  applicationIcon: const Icon(Icons.smartphone_sharp))
            },
          )
        ],
      ),
    );
  }
}
