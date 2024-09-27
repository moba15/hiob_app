import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomMultiselectionWidgetView extends StatefulWidget {
  final CustomMultiselectionWidget customMultiselectionWidget;
  const CustomMultiselectionWidgetView(
      {Key? key, required this.customMultiselectionWidget})
      : super(key: key);

  @override
  State<CustomMultiselectionWidgetView> createState() =>
      _CustomMultiselectionWidgetViewState();
}

class _CustomMultiselectionWidgetViewState
    extends State<CustomMultiselectionWidgetView> {
  DataPointBloc? bloc;
  late String title;
  @override
  void initState() {
    if (widget.customMultiselectionWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customMultiselectionWidget.dataPoint!);
    }
    title = widget.customMultiselectionWidget.label ??
        widget.customMultiselectionWidget.name;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomMultiselectionWidgetView oldWidget) {
    bloc?.close();
    if (widget.customMultiselectionWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customMultiselectionWidget.dataPoint!);
    } else {
      bloc = null;
    }
    title = widget.customMultiselectionWidget.label ??
        widget.customMultiselectionWidget.name;
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: bloc,
      builder: (context, state) {
        return ListTile(
            title: Text(title),
            trailing: FractionallySizedBox(
                widthFactor: 0.3, child: getDropdown(state.value.toString())));
      },
    );
  }

  Widget getDropdown(String value) {
    List<String> items =
        List.of(widget.customMultiselectionWidget.selections.values.toList());
    String? selected = widget.customMultiselectionWidget.selections[value];
    if (selected == null) {
      selected = "Notfound: $value";
      items.add(selected);
    }
    return DropdownButtonFormField<String>(
      value: selected,
      onChanged: (newValue) {
        String value = "";
        widget.customMultiselectionWidget.selections.forEach(
          (key, v) {
            if (v == newValue) {
              value = key;
            }
          },
        );
        bloc?.add(DataPointValueUpdateRequest(value: value, oldValue: value));
      },
      items: items.map(
        (e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        },
      ).toList(),
    );
  }
}
