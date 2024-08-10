import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input_widget/custom_input_widget.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomInputWidgetView extends StatelessWidget {
  final CustomInputWidget customInputWidget;
  const CustomInputWidgetView({Key? key, required this.customInputWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (customInputWidget.dataPoint == null) {
      return const Text("Device not found");
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: DataPointBloc(customInputWidget.dataPoint!),
      builder: (context, state) {
        TextEditingController textEditingController = TextEditingController();
        if (customInputWidget.customInputDisplayConentType ==
            CustomInputDisplayConentType.value) {
          textEditingController.text = state.value.toString();
        }
        final onChanged = customInputWidget.customInputSendMethod ==
                CustomInputSendMethod.onChanged
            ? send
            : null;
        final onSubmitted = customInputWidget.customInputSendMethod ==
                CustomInputSendMethod.onSubmitted
            ? send
            : null;
        final hintText = customInputWidget.customInputDisplayConentType ==
                CustomInputDisplayConentType.hintText
            ? state.value.toString()
            : null;
        final Text? label = customInputWidget.customInputDisplayConentType ==
                CustomInputDisplayConentType.labelText
            ? Text(state.value.toString())
            : (customInputWidget.label == null
                ? null
                : Text(customInputWidget.label!));
        return TextField(
          controller: textEditingController,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(hintText: hintText, label: label),
        );
      },
    );
  }

  void send(String value) {}
}
