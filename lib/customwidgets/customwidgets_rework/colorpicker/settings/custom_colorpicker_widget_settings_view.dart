import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomColorPickerWidgetSettingsView
    extends CustomWidgetSettingStatefulWidget {
  final CustomColorPickerWidget customColorPickerWidget;
  const CustomColorPickerWidgetSettingsView({
    Key? key,
    required this.customColorPickerWidget,
  }) : super(key: key);

  @override
  State<CustomColorPickerWidgetSettingsView> createState() =>
      _CustomColorPickerWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customColorPickerWidget;

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
    return customColorPickerWidget.dataPoint != null;
  }
}

class _CustomColorPickerWidgetSettingsViewState
    extends State<CustomColorPickerWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _labelController;

  @override
  void initState() {
    if (widget.customColorPickerWidget.pickersEnabled.isEmpty) {
      widget.customColorPickerWidget.pickersEnabled = {};
    }
    for (ColorPickerType type in ColorPickerType.values) {
      if (!widget.customColorPickerWidget.pickersEnabled.containsKey(type) &&
          type != ColorPickerType.custom) {
        widget.customColorPickerWidget.pickersEnabled[type] = false;
      }
    }
    _labelController = TextEditingController(
      text: widget.customColorPickerWidget.label,
    );

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
              onDeviceSelected: (d) => {
                c.update(widget.customColorPickerWidget),
              },
              onDataPointSelected: (d) => {
                widget.customColorPickerWidget.dataPoint = d,
                c.update(widget.customColorPickerWidget),
              },
              customWidgetManager: Manager().customWidgetManager,
              selectedDataPoint: widget.customColorPickerWidget.dataPoint,
              selectedDevice: widget.customColorPickerWidget.dataPoint?.device,
              dataPointLabel: "Datapoint (ARGB or RGB Hex Value)",
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: _labelController,
              onChanged: (d) => {
                widget.customColorPickerWidget.label = d,
                c.update(widget.customColorPickerWidget),
              },
              decoration: const InputDecoration(
                label: Text("Label (optional)"),
              ),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextFormField(
              onChanged: (s) => {widget.customColorPickerWidget.prefix = s},
              initialValue: widget.customColorPickerWidget.prefix,
              decoration: const InputDecoration(
                label: Text("Hex prefix (optional)"),
              ),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: CheckboxListTile(
              onChanged: (s) {
                setState(() {
                  widget.customColorPickerWidget.alpha = s ?? false;
                });
              },
              value: widget.customColorPickerWidget.alpha ?? false,
              title: const Text("Include Alpha Value"),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: CheckboxListTile(
              onChanged: (s) {
                setState(() {
                  widget.customColorPickerWidget.shadesSelection = s ?? false;
                });
              },
              value: widget.customColorPickerWidget.shadesSelection,
              title: const Text("Shades selection"),
            ),
          ),
          const Gap(20),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Types", style: TextStyle(fontSize: 23)),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                key: ValueKey(ColorPickerType.values[index]),
                value:
                    widget.customColorPickerWidget.pickersEnabled[widget
                        .customColorPickerWidget
                        .pickersEnabled
                        .keys
                        .elementAt(index)],
                onChanged: (s) {
                  setState(() {
                    widget.customColorPickerWidget.pickersEnabled[widget
                            .customColorPickerWidget
                            .pickersEnabled
                            .keys
                            .elementAt(index)] =
                        s ?? false;
                  });
                },
                title: Text(
                  _mapTypeToName(
                    widget.customColorPickerWidget.pickersEnabled.keys
                        .elementAt(index),
                  ),
                ),
              );
            },
            itemCount:
                widget.customColorPickerWidget.pickersEnabled.keys.length,
          ),
        ],
      ),
    );
  }

  String _mapTypeToName(ColorPickerType type) {
    switch (type) {
      case ColorPickerType.wheel:
        return "Wheel";
      case ColorPickerType.bw:
        return "Black and White";
      case ColorPickerType.accent:
        return "Accent";
      case ColorPickerType.primary:
        return "Primary";
      case ColorPickerType.both:
        return "Primary & Accent";
      default:
        return type.name;
    }
  }
}
