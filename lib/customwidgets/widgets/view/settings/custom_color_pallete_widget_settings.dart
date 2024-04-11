import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_color_pallete_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/settings/view/widget_template_setting_screen.dart';

class CustomColorPalleteWidgetSettings
    extends CustomWidgetSettingStatefulWidget {
  final CustomColorPalleteWidget customColorPalleteWidget;
  const CustomColorPalleteWidgetSettings(
      {Key? key, required this.customColorPalleteWidget})
      : super(key: key);

  @override
  State<CustomColorPalleteWidgetSettings> createState() =>
      _CustomColorPalleteWidgetSettingsState();

  @override
  CustomWidget get customWidget => customColorPalleteWidget;

  @override
  // TODO: implement showKeys
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [];

  @override
  bool validate() {
    return true;
  }
}

class _CustomColorPalleteWidgetSettingsState
    extends State<CustomColorPalleteWidgetSettings> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
