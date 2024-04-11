import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_color_pallete_widget.dart';

class CustomColorPalleteWidgetView extends StatelessWidget {
  final CustomColorPalleteWidget colorPalleteWidget;
  const CustomColorPalleteWidgetView(
      {Key? key, required this.colorPalleteWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "No Name found";
    if (colorPalleteWidget.value != null &&
        colorPalleteWidget.value!.isNotEmpty) {
      name = colorPalleteWidget.value!;
    } else if (colorPalleteWidget.name != null) {
      name = colorPalleteWidget.name!;
    }
    return ListTile(
      title: Text(name),
      onTap: () => colorPickerDialog(context),
    );
  }

  Future<bool> colorPickerDialog(BuildContext context) async {
    return ColorPicker(
      // Use the dialogPickerColor as start color.
      color: Colors.red,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) => {print("change")},

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
      showMaterialName: false,
      showColorName: true,
      showColorCode: false,
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      // New in version 3.0.0 custom transitions support.
    );
  }
}
