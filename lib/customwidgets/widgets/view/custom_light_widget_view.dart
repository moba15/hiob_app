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
    if(widget.customLightWidget.onDataPoint == null) {
      return ListTile(
        title: Text(widget.customLightWidget.name ?? "No name"),
        onTap: ()  {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Device Not Found")));
        },

      );
    }
    final onBloc = DataPointBloc(widget.customLightWidget.onDataPoint!);
    return ListTile(
      trailing: BlocBuilder<DataPointBloc, DataPointState>(
        bloc: onBloc,
        builder: (context, state)  {
          return Switch(
            inactiveThumbColor: Colors.red[500],
            activeColor: Colors.green[600],
            onChanged: (v) => {
              onBloc.add(DataPointValueUpdateRequest(value: v)),
            } ,
            value: state.value == true,
          );
        },
      ),
      title: Text(widget.customLightWidget.name ?? "No Name"),
      onTap: onTab,
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
  int? briTemp;
  @override
  Widget build(BuildContext context) {
    final briBloc = DataPointBloc(widget.customLightWidget.briDataPoint!);
    return AlertDialog(
      title: Container(
        alignment: Alignment.center,
        child: Text(widget.customLightWidget.name ?? "No Name"),
      ),
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
            margin: const EdgeInsets.only(left: 22),
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

                return SliderTheme(
                  data:  const SliderThemeData(
                    showValueIndicator: ShowValueIndicator.always,

                  ),
                  child: Slider(


                    value: briTemp?.toDouble() ?? (state.value).toDouble(),
                    label: (briTemp?.toDouble() ?? (state.value).toDouble()).round().toString(),
                    divisions: ((state.value.toDouble() > widget.customLightWidget.briMax.toDouble() ? state.value.toDouble() : widget.customLightWidget.briMax.toDouble())/widget.customLightWidget.briSteps).round(),
                    onChangeStart: (d)  {
                      setState(() {
                        briTemp = d.round();
                      });
                    },
                    onChanged: (d)  {
                      setState(() {
                        briTemp = d.round();
                      });
                    },
                    onChangeEnd: (d) => {
                      briTemp = null,
                      briBloc.add(DataPointValueUpdateRequest(value: d.round())),
                    },
                    max: state.value.toDouble() > widget.customLightWidget.briMax.toDouble() ? state.value.toDouble() : widget.customLightWidget.briMax.toDouble(),
                    min: widget.customLightWidget.briMin.toDouble(),

                  ),
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

