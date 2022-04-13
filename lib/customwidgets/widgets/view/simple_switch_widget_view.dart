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
        visualDensity: VisualDensity.compact,
        title: Text(customSimpleSwitchWidget.value ??  customSimpleSwitchWidget.name ?? "No Text Found"),
        onTap: ()  {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Device Not Found")));
        },

      );
    }
    DataPoint? dataPoint = customSimpleSwitchWidget.dataPoint;

    if (dataPoint == null) {
      return SwitchListTile(
        visualDensity: VisualDensity.compact,
        value: false,
        onChanged: (v) => {},
        title: Text(customSimpleSwitchWidget.value ??  customSimpleSwitchWidget.name ?? "No Text Found"),
        subtitle:  const Text("No Data Point found"),
      );
    }
    print(customSimpleSwitchWidget.name);
    return BlocProvider(
      create: (_) => DataPointBloc(dataPoint),
      child: SimpleSwitchWidgetDeviceView(
        text: customSimpleSwitchWidget.value ??  customSimpleSwitchWidget.name ?? "No Text Found",
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
    print("state: " + bloc.state.value.toString());
    return SwitchListTile(
      visualDensity: VisualDensity.compact,
      value: bloc.state.value == true,

      onChanged: (v) {
        bloc.add(DataPointValueUpdateRequest(value: v));
      },
      title: Text(text),
    );
  }
}
