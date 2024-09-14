import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomValueWidgetView extends StatefulWidget {
  final CustomValueWidget customValueWidget;
  const CustomValueWidgetView({Key? key, required this.customValueWidget})
      : super(key: key);

  @override
  State<CustomValueWidgetView> createState() => _CustomValueWidgetViewState();
}

class _CustomValueWidgetViewState extends State<CustomValueWidgetView> {
  late String title;
  DataPointBloc? bloc;
  @override
  void initState() {
    title = widget.customValueWidget.label == null ||
            widget.customValueWidget.label!.isEmpty
        ? widget.customValueWidget.name
        : widget.customValueWidget.label!;
    if (widget.customValueWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customValueWidget.dataPoint!);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomValueWidgetView oldWidget) {
    setState(() {
      title = widget.customValueWidget.label == null ||
              widget.customValueWidget.label!.isEmpty
          ? widget.customValueWidget.name
          : widget.customValueWidget.label!;

      bloc?.close();
      if (widget.customValueWidget.dataPoint != null) {
        bloc = DataPointBloc(widget.customValueWidget.dataPoint!);
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
      bloc: bloc,
      builder: (context, state) {
        return ListTile(
          title: Text(title),
          trailing: Text(getValue(state.value)),
          onLongPress: onLongPress,
        );
      },
    );
  }

  String getValue(dynamic value) {
    return widget.customValueWidget.valueMapper[value.toString()] ??
        value.toString();
  }

  onLongPress() {
    widget.customValueWidget.customPopupmenu?.tryOpen(context);
  }
}
