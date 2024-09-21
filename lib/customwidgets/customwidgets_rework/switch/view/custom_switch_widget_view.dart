import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomSwitchWidgetView extends StatefulWidget {
  final CustomSwitchWidget customSwitchWidget;
  const CustomSwitchWidgetView({Key? key, required this.customSwitchWidget})
      : super(key: key);

  @override
  State<CustomSwitchWidgetView> createState() => _CustomSwitchWidgetViewState();
}

class _CustomSwitchWidgetViewState extends State<CustomSwitchWidgetView> {
  late String title;
  DataPointBloc? bloc;
  @override
  void initState() {
    title = widget.customSwitchWidget.label == null ||
            widget.customSwitchWidget.label!.isEmpty
        ? widget.customSwitchWidget.name
        : widget.customSwitchWidget.label!;
    if (widget.customSwitchWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customSwitchWidget.dataPoint!);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomSwitchWidgetView oldWidget) {
    setState(() {
      title = widget.customSwitchWidget.label == null ||
              widget.customSwitchWidget.label!.isEmpty
          ? widget.customSwitchWidget.name
          : widget.customSwitchWidget.label!;

      bloc?.close();
      if (widget.customSwitchWidget.dataPoint != null) {
        bloc = DataPointBloc(widget.customSwitchWidget.dataPoint!);
      } else {
        bloc = null;
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      return const Text("Error 404");
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: bloc!,
      builder: (context, state) {
        return GestureDetector(
          onLongPress: onLongPress,
          child: SwitchListTile(
            title: Text(title),
            onChanged: (value) {
              bloc?.add(
                  DataPointValueUpdateRequest(value: value, oldValue: value));
            },
            value: state.value ?? false,
          ),
        );
      },
    );
  }

  onLongPress() {
    widget.customSwitchWidget.customPopupmenu?.tryOpen(context);
  }
}
