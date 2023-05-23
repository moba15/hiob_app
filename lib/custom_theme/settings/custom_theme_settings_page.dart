import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/custom_theme/custom_theme.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import 'package:smart_home/utils/theme.dart';

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
        _selectBrightnessMode()
      ],

    );
  }


  Widget _selectBrightnessMode() {
    return InputFieldContainer.inputContainer(
      child: DropdownButtonFormField<CustomThemeBrightness>(
        items: [
          DropdownMenuItem(
            value: CustomThemeBrightness.light,
            child: Row(
              children: [
                const Icon(Icons.light_mode),
                Container(margin: const EdgeInsets.only(left: 10)),
                const Text("Light"),
              ],
            ),
          ),
          DropdownMenuItem(
            value: CustomThemeBrightness.dark,
            child: Row(
              children: [
                const Icon(Icons.dark_mode),
                Container(margin: const EdgeInsets.only(left: 10)),
                const Text("Dark"),
              ],
            ),
          ),
          DropdownMenuItem(
            value: CustomThemeBrightness.system,
            child: Row(
              children: [
                const Icon(Icons.sync),
                Container(margin: const EdgeInsets.only(left: 10)),
                const Text("System"),
              ],
            ),

          )
        ],
        onChanged: (bri) {

        },
      )
    );
  }
}
