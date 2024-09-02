import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    DataPointBloc bloc = DataPointBloc(customInputWidget.dataPoint!);

    /*DataPointBloc bloc context.select<DataPointBloc, DataPointBloc>((value) {
      if (value.dataPoint == customInputWidget.dataPoint) {
        return value;
      }
      throw ErrorDescription("No bloc found for dataPoint");
    });*/

    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: bloc,
      builder: (context, state) {
        TextEditingController textEditingController = TextEditingController();
        if (customInputWidget.customInputDisplayConentType ==
            CustomInputDisplayConentType.value) {
          textEditingController.text = state.value.toString();
        }
        final onChanged = null;
        final onSubmitted = customInputWidget.customInputSendMethod ==
                CustomInputSendMethod.onSubmitted
            ? send
            : null;
        final hintText = customInputWidget.customInputDisplayConentType ==
                CustomInputDisplayConentType.hintText
            ? state.value.toString()
            : null;
        final Text? label =
            customInputWidget.label == null || customInputWidget.label!.isEmpty
                ? Text(customInputWidget.name)
                : Text(customInputWidget.label!);
        return TextField(
          controller: textEditingController,
          onChanged: (v) => onChanged != null ? onChanged(v, bloc) : null,
          onSubmitted: (v) => onSubmitted != null ? onSubmitted(v, bloc) : null,
          decoration: InputDecoration(
              hintText: hintText,
              label: label,
              floatingLabelBehavior: FloatingLabelBehavior.always),
        );
      },
    );
  }

  void send(String value, DataPointBloc bloc) {
    bloc.add(DataPointValueUpdateRequest(oldValue: value, value: value));
  }
}
