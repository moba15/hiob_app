import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
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

  @override
  final bool deprecated = false;
}

class _CustomInputWidgetSettingsViewState
    extends State<CustomInputWidgetSettingsView> {
  @override
  Widget build(BuildContext context) {
    CustomWidgetBlocCubit c = context.read<CustomWidgetBlocCubit>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
              child: TextField(
            onChanged: (d) => {
              widget.customInputWidget.label = d,
              c.update(widget.customInputWidget)
            },
            controller:
                TextEditingController(text: widget.customInputWidget.label),
            decoration: const InputDecoration(label: Text("Label (optional)")),
          )),
          InputFieldContainer.inputContainer(
              child: DeviceSelection(
            onDeviceSelected: (d) => {c.update(widget.customInputWidget)},
            onDataPointSelected: (d) => {
              widget.customInputWidget.dataPoint = d,
              c.update(widget.customInputWidget)
            },
            customWidgetManager: Manager().customWidgetManager,
            selectedDataPoint: widget.customInputWidget.dataPoint,
            selectedDevice: widget.customInputWidget.dataPoint?.device,
          )),
          InputFieldContainer.inputContainer(
              child: DropdownSearch<CustomInputSendMethod>(
            items: CustomInputSendMethod.values,
            itemAsString: (item) => item.name,
            selectedItem: widget.customInputWidget.customInputSendMethod,
            dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration:
                    InputDecoration(label: Text("Input send method"))),
            onChanged: (s) => {
              widget.customInputWidget.customInputSendMethod = s,
              c.update(widget.customInputWidget)
            },
          )),
          InputFieldContainer.inputContainer(
              child: DropdownSearch<CustomInputDisplayConentType>(
            items: CustomInputDisplayConentType.values,
            itemAsString: (item) => item.name,
            selectedItem: widget.customInputWidget.customInputDisplayConentType,
            dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration:
                    InputDecoration(label: Text("Input display method"))),
            onChanged: (s) => {
              widget.customInputWidget.customInputDisplayConentType = s,
              c.update(widget.customInputWidget)
            },
          )),
        ],
      ),
    );
  }
}
