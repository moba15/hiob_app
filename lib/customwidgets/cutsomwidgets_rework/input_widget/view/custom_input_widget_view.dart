import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input_widget/custom_input_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

class CustomInputWidgetView extends StatelessWidget {
  final CustomInputWidget customInputWidget;
  const CustomInputWidgetView({Key? key, required this.customInputWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (customInputWidget.dataPoint == null) {
      return Text("Device not found");
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: DataPointBloc(customInputWidget.dataPoint!),
      builder: (context, state) {
        return Placeholder();
      },
    );
  }
}
