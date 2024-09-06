import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomButtonWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomButtonWidget customButtonWidget;
  const CustomButtonWidgetSettingsView(
      {Key? key, required this.customButtonWidget})
      : super(key: key);

  @override
  State<CustomButtonWidgetSettingsView> createState() =>
      _CustomButtonWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customButtonWidget;

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  bool get deprecated => false;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError("asdasd");

  @override
  bool validate() {
    return customButtonWidget.dataPoint != null;
  }
}

class _CustomButtonWidgetSettingsViewState
    extends State<CustomButtonWidgetSettingsView> {
  late final TextEditingController buttonLabelEditingController,
      valueTextEditingController;
  late CustomWidgetBlocCubit c;
  @override
  void initState() {
    buttonLabelEditingController =
        TextEditingController(text: widget.customButtonWidget.buttonLabel);
    valueTextEditingController =
        TextEditingController(text: widget.customButtonWidget.label);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(children: [
          InputFieldContainer.inputContainer(
              child: TextField(
            controller: valueTextEditingController,
            decoration: const InputDecoration(label: Text("Label (optional)")),
            onChanged: (s) => {
              widget.customButtonWidget.label = s,
              c.update(widget.customButtonWidget)
            },
          )),
          InputFieldContainer.inputContainer(
              child: DeviceSelection(
            onDeviceSelected: (d) => {c.update(widget.customButtonWidget)},
            onDataPointSelected: (d) => {
              widget.customButtonWidget.dataPoint = d,
              c.update(widget.customButtonWidget)
            },
            customWidgetManager: Manager().customWidgetManager,
            selectedDataPoint: widget.customButtonWidget.dataPoint,
            selectedDevice: widget.customButtonWidget.dataPoint?.device,
          )),
          InputFieldContainer.inputContainer(
              child: TextField(
            controller: buttonLabelEditingController,
            decoration:
                const InputDecoration(label: Text("Button label (optional)")),
            onChanged: (s) => {
              widget.customButtonWidget.buttonLabel = s,
              c.update(widget.customButtonWidget)
            },
          ))
        ]));
  }
}
