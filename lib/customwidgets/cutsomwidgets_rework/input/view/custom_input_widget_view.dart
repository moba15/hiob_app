import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomInputWidgetView extends StatefulWidget {
  final CustomInputWidget customInputWidget;
  const CustomInputWidgetView({Key? key, required this.customInputWidget})
      : super(key: key);

  @override
  State<CustomInputWidgetView> createState() => _CustomInputWidgetViewState();
}

class _CustomInputWidgetViewState extends State<CustomInputWidgetView> {
  late DataPointBloc bloc;
  @override
  void initState() {
    bloc = DataPointBloc(widget.customInputWidget.dataPoint!);

    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.customInputWidget.dataPoint == null) {
      return const Text("Device not found");
    }

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
        if (widget.customInputWidget.customInputDisplayConentType ==
            CustomInputDisplayConentType.value) {
          textEditingController.text = state.value.toString();
        }
        const onChanged = null;
        final onSubmitted = widget.customInputWidget.customInputSendMethod ==
                CustomInputSendMethod.onSubmitted
            ? send
            : null;
        final hintText =
            widget.customInputWidget.customInputDisplayConentType ==
                    CustomInputDisplayConentType.hintText
                ? state.value.toString()
                : null;
        final Text label = widget.customInputWidget.label == null ||
                widget.customInputWidget.label!.isEmpty
            ? Text(widget.customInputWidget.name)
            : Text(widget.customInputWidget.label!);
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
