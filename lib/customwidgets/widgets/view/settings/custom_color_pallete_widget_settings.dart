import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/customwidgets/custom_color_pallete_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomColorPalleteWidgetSettings
    extends CustomWidgetSettingStatefulWidget {
  final CustomColorPalleteWidget customColorPalleteWidget;
  const CustomColorPalleteWidgetSettings(
      {Key? key, required this.customColorPalleteWidget})
      : super(key: key);

  @override
  State<CustomColorPalleteWidgetSettings> createState() =>
      _CustomColorPalleteWidgetSettingsState();

  @override
  CustomWidget get customWidget => customColorPalleteWidget;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [];

  @override
  bool validate() {
    return true;
  }
}

class _CustomColorPalleteWidgetSettingsState
    extends State<CustomColorPalleteWidgetSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            InputFieldContainer.inputContainer(
                child: TextFormField(
              onChanged: (s) => {widget.customColorPalleteWidget.value = s},
              initialValue: widget.customColorPalleteWidget.value,
              decoration:
                  const InputDecoration(label: Text("Value (optional)")),
            )),
            InputFieldContainer.inputContainer(
                child: DeviceSelection(
                    onDeviceSelected: (d) => {},
                    onDataPointSelected: (d) {
                      widget.customColorPalleteWidget.dataPoint = d;
                      widget.customColorPalleteWidget.device = d?.device;
                    },
                    dataPointLabel: "Datapoint (ARGB or RGB Hex Value)",
                    selectedDataPoint:
                        widget.customColorPalleteWidget.dataPoint,
                    selectedDevice: widget.customColorPalleteWidget.device,
                    customWidgetManager: Manager().customWidgetManager)),
            InputFieldContainer.inputContainer(
                child: TextFormField(
              onChanged: (s) => {widget.customColorPalleteWidget.prefix = s},
              initialValue: widget.customColorPalleteWidget.prefix,
              decoration:
                  const InputDecoration(label: Text("Hex prefix (optional)")),
            )),
            InputFieldContainer.inputContainer(
                child: CheckboxListTile(
              onChanged: (s) {
                setState(() {
                  widget.customColorPalleteWidget.alpha = s ?? false;
                });
              },
              value: widget.customColorPalleteWidget.alpha ?? false,
              title: const Text("Include Alpha Value"),
            )),
            InputFieldContainer.inputContainer(
                child: CheckboxListTile(
              onChanged: (s) {
                setState(() {
                  widget.customColorPalleteWidget.shadesSelection = s ?? false;
                });
              },
              value: widget.customColorPalleteWidget.shadesSelection,
              title: const Text("Shades selection"),
            )),
            const Gap(20),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Types",
                style: TextStyle(fontSize: 23),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  key: ValueKey(ColorPickerType.values[index]),
                  value: widget.customColorPalleteWidget.pickersEnabled[widget
                      .customColorPalleteWidget.pickersEnabled.keys
                      .elementAt(index)],
                  onChanged: (s) {
                    setState(() {
                      widget.customColorPalleteWidget.pickersEnabled[widget
                          .customColorPalleteWidget.pickersEnabled.keys
                          .elementAt(index)] = s ?? false;
                    });
                  },
                  title: Text(_mapTypeToName(widget
                      .customColorPalleteWidget.pickersEnabled.keys
                      .elementAt(index))),
                );
              },
              itemCount:
                  widget.customColorPalleteWidget.pickersEnabled.keys.length,
            )
          ],
        ));
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
