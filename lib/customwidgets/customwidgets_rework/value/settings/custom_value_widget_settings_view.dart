import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/utils/widgets/map/map_order_add_setting_template.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomValueWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomValueWidget customValueWidget;
  const CustomValueWidgetSettingsView(
      {Key? key, required this.customValueWidget})
      : super(key: key);

  @override
  State<CustomValueWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customValueWidget;

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
    return customValueWidget.dataPoint != null;
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomValueWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _labelController;

  @override
  void initState() {
    _labelController =
        TextEditingController(text: widget.customValueWidget.label);
    super.initState();
  }

  @override
  void dispose() {
    _labelController.dispose();
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
            onDeviceSelected: (d) => {c.update(widget.customValueWidget)},
            onDataPointSelected: (d) => {
              widget.customValueWidget.dataPoint = d,
              c.update(widget.customValueWidget)
            },
            customWidgetManager: Manager().customWidgetManager,
            selectedDataPoint: widget.customValueWidget.dataPoint,
            selectedDevice: widget.customValueWidget.dataPoint?.device,
          )),
          InputFieldContainer.inputContainer(
              child: TextField(
            controller:
                TextEditingController(text: widget.customValueWidget.label),
            onChanged: (d) => {
              widget.customValueWidget.label = d,
              c.update(widget.customValueWidget)
            },
            decoration: const InputDecoration(label: Text("Label (optional)")),
          )),
          InputFieldContainer.inputContainer(
              child: MapOrderSettingTemplate<String>(
                  title: const Text("Value mapper"),
                  data: Map.from(widget.customValueWidget.valueMapper),
                  onChange: (p0) {
                    widget.customValueWidget.valueMapper = p0;
                    c.update(widget.customValueWidget);
                  },
                  toStr: (p0) {
                    return p0.toString();
                  },
                  fromStr: (p0) {
                    return p0;
                  },
                  alertTitle: const Text("Value Mapper (optional)"),
                  alertKeyText: "Value to map from",
                  alertValueText: "Value to map to",
                  keyTileText: "Map from: ",
                  valueTileText: "Map to: ")),
        ],
      ),
    );
  }
}
