import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';

class CustomTableWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomTableWidget customTableWidget;
  const CustomTableWidgetSettingsView(
      {Key? key, required this.customTableWidget})
      : super(key: key);

  @override
  State<CustomTableWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  bool get deprecated => false;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    throw UnimplementedError();
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomTableWidgetSettingsView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
