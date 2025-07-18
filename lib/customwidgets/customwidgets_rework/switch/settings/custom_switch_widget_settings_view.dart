import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomSwitchWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomSwitchWidget customSwitchWidget;
  const CustomSwitchWidgetSettingsView({
    Key? key,
    required this.customSwitchWidget,
  }) : super(key: key);

  @override
  State<CustomSwitchWidgetSettingsView> createState() =>
      _CustomSwitchWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customSwitchWidget;

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
    return customSwitchWidget.dataPoint != null;
  }
}

class _CustomSwitchWidgetSettingsViewState
    extends State<CustomSwitchWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _labelController, _offController, _onController;

  @override
  void initState() {
    _labelController = TextEditingController(
      text: widget.customSwitchWidget.label,
    );
    _offController = TextEditingController(
      text: widget.customSwitchWidget.sendIfOff,
    );
    _onController = TextEditingController(
      text: widget.customSwitchWidget.sendIfOn,
    );
    super.initState();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _offController.dispose();
    _onController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
            child: DeviceSelection(
              onDeviceSelected: (d) => {c.update(widget.customSwitchWidget)},
              onDataPointSelected: (d) => {
                widget.customSwitchWidget.dataPoint = d,
                c.update(widget.customSwitchWidget),
              },
              customWidgetManager: Manager().customWidgetManager,
              selectedDataPoint: widget.customSwitchWidget.dataPoint,
              selectedDevice: widget.customSwitchWidget.dataPoint?.device,
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: _labelController,
              onChanged: (d) => {
                widget.customSwitchWidget.label = d,
                c.update(widget.customSwitchWidget),
              },
              decoration: const InputDecoration(
                label: Text("Label (optional)"),
              ),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: _onController,
              onChanged: (d) => {
                widget.customSwitchWidget.sendIfOn = d,
                c.update(widget.customSwitchWidget),
              },
              decoration: const InputDecoration(label: Text("Send if on")),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: _offController,
              onChanged: (d) => {
                widget.customSwitchWidget.sendIfOff = d,
                c.update(widget.customSwitchWidget),
              },
              decoration: const InputDecoration(label: Text("Send if off")),
            ),
          ),
        ],
      ),
    );
  }
}
