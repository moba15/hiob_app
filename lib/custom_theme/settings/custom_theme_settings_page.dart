import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

class CustomThemeSettingsPage extends StatelessWidget {
  const CustomThemeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getAppLocalizations(context).custom_theme_settings_page_title),
      ),

      body: const _CustomThemeSettingsBody(),
    );
  }
}


class _CustomThemeSettingsBody extends StatelessWidget {
  const _CustomThemeSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeManager themeManager = context.select((Manager manager) => manager.themeManager);
    /*
      TODO: Bloc Pattern etc.
     */
    return ListView(


      children: [

      ],

    );
  }


  Widget _selectBrightnessMode() {
    return Placeholder();
  }
}
