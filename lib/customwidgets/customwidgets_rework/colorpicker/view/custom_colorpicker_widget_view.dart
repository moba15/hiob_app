import 'dart:convert';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomColorPickerWidgetView extends StatefulWidget {
  final CustomColorPickerWidget customColorPickerWidget;
  const CustomColorPickerWidgetView(
      {Key? key, required this.customColorPickerWidget})
      : super(key: key);

  @override
  State<CustomColorPickerWidgetView> createState() =>
      _CustomColorPickerWidgetViewState();
}

class _CustomColorPickerWidgetViewState
    extends State<CustomColorPickerWidgetView> {
  late String _name;
  DataPointBloc? _bloc;

  @override
  void initState() {
    if (widget.customColorPickerWidget.dataPoint != null) {
      _bloc = DataPointBloc(widget.customColorPickerWidget.dataPoint!);
    }
    _name = widget.customColorPickerWidget.label != null &&
            widget.customColorPickerWidget.label!.isNotEmpty
        ? widget.customColorPickerWidget.label!
        : widget.customColorPickerWidget.name;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomColorPickerWidgetView oldWidget) {
    _bloc?.close();
    setState(() {
      if (widget.customColorPickerWidget.dataPoint != null) {
        _bloc = DataPointBloc(widget.customColorPickerWidget.dataPoint!);
      }
      _name = widget.customColorPickerWidget.label != null &&
              widget.customColorPickerWidget.label!.isNotEmpty
          ? widget.customColorPickerWidget.label!
          : widget.customColorPickerWidget.name;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      return const ListTile(
        title: Text("Error 404: Device Not found"),
      );
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: _bloc!,
      builder: (c, state) {
        String value = state.value.toString();

        if (widget.customColorPickerWidget.prefix.trim().isNotEmpty) {
          value = value.replaceFirst(widget.customColorPickerWidget.prefix, "");
        }
        if (value.startsWith("0x")) {
          value = value.replaceFirst("0x", "");
        }
        var regExp = RegExp(r'[A-F]|[0-9]');
        value = value.toUpperCase();
        if (regExp.allMatches(value).isEmpty ||
            (regExp.allMatches(value).length != 6 &&
                regExp.allMatches(value).length != 8)) {
          return ListTile(
            title: Text(_name),
            trailing: Text("Not supported value: $value"),
            onTap: () => colorPickerDialog(
                context, _bloc!, const Color.fromARGB(0, 0, 0, 0)),
          );
        }
        int? alpha;
        int? red;
        int? green;
        int? blue;
        if (value.length == 6) {
          alpha = 255;
          red = int.tryParse(value.substring(0, 2), radix: 16);
          green = int.tryParse(value.substring(2, 4), radix: 16);
          blue = int.tryParse(value.substring(4, 6), radix: 16);
        } else if (value.length == 8) {
          alpha = int.tryParse(value.substring(0, 2), radix: 16);
          red = int.tryParse(value.substring(2, 4), radix: 16);
          green = int.tryParse(value.substring(4, 6), radix: 16);
          blue = int.tryParse(value.substring(6, 8), radix: 16);
        }

        return ListTile(
            title: Text(_name),
            trailing: alpha == null ||
                    red == null ||
                    blue == null ||
                    green == null
                ? Text(
                    "Currently only hex values are supported: ${state.value}")
                : ColorIndicator(
                    color: Color.fromARGB(alpha, red, green, blue),
                  ),
            onTap: () async {
              Color newColor = await colorPickerDialog(context, _bloc!,
                  Color.fromARGB(alpha ?? 0, red ?? 0, green ?? 0, blue ?? 0));
              _bloc?.add(DataPointValueUpdateRequest(
                  value: widget.customColorPickerWidget.prefix +
                      (widget.customColorPickerWidget.alpha == true
                          ? newColor.hexAlpha
                          : newColor.hex),
                  oldValue: newColor.hex));
            });
      },
    );
  }

  Future<Color> colorPickerDialog(
      BuildContext context, DataPointBloc bloc, Color selectedColor) async {
    return showColorPickerDialog(context, selectedColor,
        width: 40,
        height: 40,
        borderRadius: 4,
        spacing: 5,
        runSpacing: 5,
        wheelDiameter: 155,
        heading: Text(
          'Select color',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subheading: Text(
          'Select color shade',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        wheelSubheading: Text(
          'Selected color and its shades',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        maxRecentColors: 2,
        showRecentColors: false,
        showMaterialName: false,
        showColorName: false,
        showColorCode: false,
        enableTonalPalette: true,
        enableShadesSelection: widget.customColorPickerWidget.shadesSelection,
        materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
        colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
        colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
        pickersEnabled: widget.customColorPickerWidget.pickersEnabled);
  }
}
