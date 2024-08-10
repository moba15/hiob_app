import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/customwidgets/custom_color_palette_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomColorPaletteWidgetSettings
    extends CustomWidgetSettingStatefulWidget {
  final CustomColorPaletteWidget customColorPaletteWidget;
  const CustomColorPaletteWidgetSettings(
      {Key? key, required this.customColorPaletteWidget})
      : super(key: key);

  @override
  State<CustomColorPaletteWidgetSettings> createState() =>
      _CustomColorPaletteWidgetSettingsState();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated => customColorPaletteWidget;
  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [];

  @override
  bool validate() {
    return true;
  }

  @override
  // TODO: implement deprecated
  bool get deprecated => true;
}

class _CustomColorPaletteWidgetSettingsState
    extends State<CustomColorPaletteWidgetSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            InputFieldContainer.inputContainer(
                child: TextFormField(
              onChanged: (s) => {widget.customColorPaletteWidget.value = s},
              initialValue: widget.customColorPaletteWidget.value,
              decoration:
                  const InputDecoration(label: Text("Value (optional)")),
            )),
            InputFieldContainer.inputContainer(
                child: DeviceSelection(
                    onDeviceSelected: (d) => {},
                    onDataPointSelected: (d) {
                      widget.customColorPaletteWidget.dataPoint = d;
                      widget.customColorPaletteWidget.device = d?.device;
                    },
                    dataPointLabel: "Datapoint (ARGB or RGB Hex Value)",
                    selectedDataPoint:
                        widget.customColorPaletteWidget.dataPoint,
                    selectedDevice: widget.customColorPaletteWidget.device,
                    customWidgetManager: Manager().customWidgetManager)),
            InputFieldContainer.inputContainer(
                child: TextFormField(
              onChanged: (s) => {widget.customColorPaletteWidget.prefix = s},
              initialValue: widget.customColorPaletteWidget.prefix,
              decoration:
                  const InputDecoration(label: Text("Hex prefix (optional)")),
            )),
            InputFieldContainer.inputContainer(
                child: CheckboxListTile(
              onChanged: (s) {
                setState(() {
                  widget.customColorPaletteWidget.alpha = s ?? false;
                });
              },
              value: widget.customColorPaletteWidget.alpha ?? false,
              title: const Text("Include Alpha Value"),
            )),
            InputFieldContainer.inputContainer(
                child: CheckboxListTile(
              onChanged: (s) {
                setState(() {
                  widget.customColorPaletteWidget.shadesSelection = s ?? false;
                });
              },
              value: widget.customColorPaletteWidget.shadesSelection,
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
                  value: widget.customColorPaletteWidget.pickersEnabled[widget
                      .customColorPaletteWidget.pickersEnabled.keys
                      .elementAt(index)],
                  onChanged: (s) {
                    setState(() {
                      widget.customColorPaletteWidget.pickersEnabled[widget
                          .customColorPaletteWidget.pickersEnabled.keys
                          .elementAt(index)] = s ?? false;
                    });
                  },
                  title: Text(_mapTypeToName(widget
                      .customColorPaletteWidget.pickersEnabled.keys
                      .elementAt(index))),
                );
              },
              itemCount:
                  widget.customColorPaletteWidget.pickersEnabled.keys.length,
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
