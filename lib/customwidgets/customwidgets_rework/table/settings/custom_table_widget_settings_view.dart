import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomTableWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomTableWidget customTableWidget;
  const CustomTableWidgetSettingsView(
      {Key? key, required this.customTableWidget})
      : super(key: key);

  @override
  State<CustomTableWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  bool get deprecated => false;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    throw UnimplementedError();
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomTableWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _headerController;

  @override
  void initState() {
    _headerController =
        TextEditingController(text: widget.customTableWidget.header);
    super.initState();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
              child: DeviceSelection(
            onDeviceSelected: (d) => {c.update(widget.customTableWidget)},
            onDataPointSelected: (d) => {
              widget.customTableWidget.dataPoint = d,
              c.update(widget.customTableWidget)
            },
            customWidgetManager: Manager().customWidgetManager,
            selectedDataPoint: widget.customTableWidget.dataPoint,
            selectedDevice: widget.customTableWidget.dataPoint?.device,
          )),
          InputFieldContainer.inputContainer(
              child: TextField(
            onChanged: (d) => {
              widget.customTableWidget.header = d,
              c.update(widget.customTableWidget)
            },
            decoration: const InputDecoration(label: Text("Header (optional)")),
          )),
        ],
      ),
    );
  }
}
