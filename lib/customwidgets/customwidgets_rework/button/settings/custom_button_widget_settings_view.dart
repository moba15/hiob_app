import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/settings/common/devices/state_search_bar.dart';
import 'package:smart_home/utils/theme.dart';

class CustomButtonWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomButtonWidget customButtonWidget;
  const CustomButtonWidgetSettingsView(
      {super.key, required this.customButtonWidget});

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


  bool _valueTextManuallyChanged = false;


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
              _valueTextManuallyChanged = true,
              valueTextChanged(s)
            },
          )),
          InputFieldContainer.inputContainer(
              child: StateSearchBar(
            onSelected: onSelect,
          )),
          InputFieldContainer.inputContainer(
              child: TextField(
            controller: buttonLabelEditingController,
            decoration:
                const InputDecoration(label: Text("Button label (optional)")),
            onChanged: (s) => {
              buttonLabelChanged(s)
            },
          ))
        ]));
  }

  void onSelect(IobrokerObject iobrokerObject) {
    widget.customButtonWidget.dataPoint = iobrokerObject.id;
    c.update(widget.customButtonWidget);
    if(valueTextEditingController.text.isEmpty || !_valueTextManuallyChanged) {
      valueTextChanged("${iobrokerObject.name ?? iobrokerObject.id} Button");
      valueTextEditingController.text = widget.customButtonWidget.label!;
      _valueTextManuallyChanged = false;
      
    }
  }

  void buttonLabelChanged(String s) {
    widget.customButtonWidget.buttonLabel = s;
    c.update(widget.customButtonWidget);
  }

  void valueTextChanged(String s) {
    widget.customButtonWidget.label = s;
    c.update(widget.customButtonWidget);
  }
}
