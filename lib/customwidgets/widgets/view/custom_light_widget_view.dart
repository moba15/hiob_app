import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

class CustomLightWidgetView extends StatefulWidget {
  final CustomLightWidget customLightWidget;
  const CustomLightWidgetView({Key? key, required this.customLightWidget}) : super(key: key);

  @override
  State<CustomLightWidgetView> createState() => _CustomLightWidgetViewState();
}

class _CustomLightWidgetViewState extends State<CustomLightWidgetView> {
  @override
  Widget build(BuildContext context) {
    final onBloc = DataPointBloc(widget.customLightWidget.onDataPoint!);
    return Card(
      child: ListTile(
        trailing: BlocBuilder<DataPointBloc, DataPointState>(
          bloc: onBloc,
          builder: (context, state)  {
            return Switch(
              onChanged: (v) => {
                onBloc.add(DataPointValueUpdateRequest(value: v)),
              } ,
              value: state.value == true,
            );
          },
        ),
        title: Text(widget.customLightWidget.display),
        onTap: onTab,
      ),
    );
  }

  void onTab() {
    if(widget.customLightWidget.briDataPoint != null) {
      showDialog(
          context: context,
          builder: (context) =>  _CustomLightWidgetAlert(customLightWidget: widget.customLightWidget),
      );
    }
  }
}

class _CustomLightWidgetAlert extends StatefulWidget {
  final CustomLightWidget customLightWidget;
  const _CustomLightWidgetAlert({Key? key, required this.customLightWidget }) : super(key: key);

  @override
  State<_CustomLightWidgetAlert> createState() => _CustomLightWidgetAlertState();
}

class _CustomLightWidgetAlertState extends State<_CustomLightWidgetAlert> {
  @override
  Widget build(BuildContext context) {
    final briBloc = DataPointBloc(widget.customLightWidget.briDataPoint!);
    return AlertDialog(
      title: Text(widget.customLightWidget.display),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Back"))
      ],
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(
              Radius.circular(10.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(widget.customLightWidget.briDisplay) ,
          ),
          Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.zero,
            width: double.infinity,
            child: BlocBuilder<DataPointBloc, DataPointState>(
              bloc: briBloc,
              builder: (context, state)  {
                return Slider(

                  value: (state.value).toDouble(),
                  label: (state.value).round().toString(),
                  divisions: ((state.value.toDouble() > widget.customLightWidget.briMax.toDouble() ? state.value.toDouble() : widget.customLightWidget.briMax.toDouble())/widget.customLightWidget.briSteps).round(),
                  onChanged: (d) => {
                    briBloc.add(DataPointValueUpdateRequest(value: d.round())),
                  },
                  max: state.value.toDouble() > widget.customLightWidget.briMax.toDouble() ? state.value.toDouble() : widget.customLightWidget.briMax.toDouble(),
                  min: widget.customLightWidget.briMin.toDouble(),

                );
              },
            )
          ),
          if(widget.customLightWidget.reachableDataPoint != null)
            BlocBuilder<DataPointBloc, DataPointState>(
              bloc: DataPointBloc(widget.customLightWidget.reachableDataPoint!),
              builder: ((context, state)  {
                return ListTile(
                  title: Text(widget.customLightWidget.reachableDisplay),
                  trailing: Text(state.value.toString(), style: TextStyle(color: state.value == true ? Colors.green: Colors.red),),
                  onTap: () => {},
                  leading: const Icon(Icons.wb_incandescent),
                );
              }),
            ),

        ],
      ),

    );
  }
}

