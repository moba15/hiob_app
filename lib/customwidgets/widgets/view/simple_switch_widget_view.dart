import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class SimpleSwitchWidgetView extends StatelessWidget {
  final CustomSimpleSwitchWidget customSimpleSwitchWidget;

  const SimpleSwitchWidgetView({Key? key, required this.customSimpleSwitchWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(customSimpleSwitchWidget.dataPoint == null) {
      return ListTile(
        title: Text(customSimpleSwitchWidget.text?? "No Text Found"),
        onTap: ()  {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Device Not Found")));
        },

      );
    }
    DataPoint? dataPoint = customSimpleSwitchWidget.dataPoint;

    if (dataPoint == null) {
      return SwitchListTile(
        value: false,
        onChanged: (v) => {},
        title: Text(customSimpleSwitchWidget.text ?? "No Text Found"),
        subtitle:  const Text("No Data Point found"),
      );
    }

    return BlocProvider(
      create: (_) => DataPointBloc(dataPoint),
      child: SimpleSwitchWidgetDeviceView(
        text: customSimpleSwitchWidget.text ?? "No Text Found",
      ),
    );
  }
}

class SimpleSwitchWidgetDeviceView extends StatelessWidget {
  final String text;

  const SimpleSwitchWidgetDeviceView({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DataPointBloc>();
    return SwitchListTile(
      value: bloc.state.value == true,
      onChanged: (v) {
        bloc.add(DataPointValueUpdateRequest(value: v));
      },
      title: Text(text),
    );
  }
}
