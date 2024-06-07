import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input_widget/custom_input_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomInputWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomInputWidget customInputWidget;
  const CustomInputWidgetSettingsView(
      {Key? key, required this.customInputWidget})
      : super(key: key);

  @override
  State<CustomInputWidgetSettingsView> createState() =>
      _CustomInputWidgetSettingsViewState();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    return customInputWidget.dataPoint != null;
  }

  @override
  CustomWidget get customWidget => customInputWidget;
}

class _CustomInputWidgetSettingsViewState
    extends State<CustomInputWidgetSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
              child: DeviceSelection(
            onDeviceSelected: (d) => {},
            onDataPointSelected: (d) =>
                {widget.customInputWidget.dataPoint = d},
            customWidgetManager: Manager().customWidgetManager,
            selectedDataPoint: widget.customInputWidget.dataPoint,
            selectedDevice: widget.customInputWidget.dataPoint?.device,
          )),
          InputFieldContainer.inputContainer(
              child: DropdownSearch<CustomInputSendMethod>(
            items: CustomInputSendMethod.values,
            selectedItem: widget.customInputWidget.customInputSendMethod,
            onChanged: (s) =>
                {widget.customInputWidget.customInputSendMethod = s},
          )),
          InputFieldContainer.inputContainer(
              child: DropdownSearch<CustomInputDisplayConentType>(
            items: CustomInputDisplayConentType.values,
            selectedItem: widget.customInputWidget.customInputDisplayConentType,
            onChanged: (s) =>
                {widget.customInputWidget.customInputDisplayConentType = s},
          )),
        ],
      ),
    );
  }
}
