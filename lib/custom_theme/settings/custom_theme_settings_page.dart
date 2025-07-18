import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/custom_theme/cubit/custom_theme_cubit.dart';
import 'package:smart_home/custom_theme/custom_theme.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';
import 'package:smart_home/utils/theme.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class CustomThemeSettingsPage extends StatelessWidget {
  const CustomThemeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getAppLocalizations(context).custom_theme_settings_page_title,
        ),
      ),
      body: _CustomThemeSettingsBody(),
    );
  }
}

class _CustomThemeSettingsBody extends StatelessWidget {
  final ThemeManager themeManager = Manager().themeManager;
  _CustomThemeSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
      TODO: Bloc Pattern etc.
     */
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: ListView(
        children: [
          _selectBrightnessMode(),
          const Divider(),
          const Text("App Bar Elevation"),
          _appBarElevationSlider(),
          const Text("Textscale (beta)", style: TextStyle(color: Colors.green)),
          _scaleSlider(),
          _seedColorPicker(),
        ],
      ),
    );
  }

  Widget _selectBrightnessMode() {
    return InputFieldContainer.inputContainer(
      child: DropdownButtonFormField<CustomThemeBrightness>(
        decoration: const InputDecoration(border: OutlineInputBorder()),
        value: themeManager.loadedCustomTheme.customThemeBrightness,
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
          ),
        ],
        onChanged: (bri) {
          if (bri == null) {
          } else {
            themeManager.changeTheme(
              customTheme: themeManager.loadedCustomTheme.copyOf(
                customThemeBrightness: bri,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _appBarElevationSlider() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Slider(
          value: themeManager.loadedCustomTheme.appBarElevation,
          min: 0,
          max: 100,
          label: themeManager.loadedCustomTheme.appBarElevation
              .round()
              .toString(),
          divisions: 20,
          onChanged: (d) {
            setState(() {
              themeManager.changeTheme(
                customTheme: themeManager.loadedCustomTheme.copyOf(
                  appBarElevation: d,
                ),
              );
            });
          },
        );
      },
    );
  }

  Widget _scaleSlider() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Slider(
          value: themeManager.loadedCustomTheme.textScale,
          min: 0.5,
          max: 1.9,
          label: themeManager.loadedCustomTheme.textScale.toStringAsFixed(1),
          divisions: 14,
          onChanged: (d) {
            setState(() {
              themeManager.changeTheme(
                customTheme: themeManager.loadedCustomTheme.copyOf(
                  textScale: d,
                ),
              );
            });
          },
        );
      },
    );
  }

  Widget _seedColorPicker() {
    return const _ColorPickerListTile();
  }
}

class _ColorPickerListTile extends StatefulWidget {
  const _ColorPickerListTile({Key? key}) : super(key: key);

  @override
  State<_ColorPickerListTile> createState() => _ColorPickerListTileState();
}

class _ColorPickerListTileState extends State<_ColorPickerListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.color_lens),
      title: const Text("Seed color"),
      trailing: BlocBuilder<CustomThemeCubit, CustomThemeState>(
        bloc: CustomThemeCubit(manager: Manager())..loadTheme(),
        builder: (context, state) {
          return ColorIndicator(
            color: state.customTheme.customColorScheme.color,
            onSelect: () =>
                _colorPicker(state.customTheme.customColorScheme.color),
          );
        },
      ),
    );
  }

  void _colorPicker(Color color) {
    ColorPicker(
      color: color,
      title: const Text("Seed color"),
      showColorName: true,
      pickersEnabled: const {
        ColorPickerType.primary: true,
        ColorPickerType.accent: false,
        ColorPickerType.both: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: false,
      },
      onColorChanged: (value) {
        Manager().themeManager.changeTheme(
          customTheme: Manager().themeManager.loadedCustomTheme.copyOf(
            customColorScheme: CustomColorScheme(
              customColorSchemeMode: CustomColorSchemeMode.fromSeed,
              color: value,
            ),
          ),
        );
      },
    ).showPickerDialog(context);
  }
}
