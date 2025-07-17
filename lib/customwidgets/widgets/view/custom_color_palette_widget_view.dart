import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_color_palette_widget.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomColorPaletteWidgetView extends StatelessWidget {
  final CustomColorPaletteWidget colorPaletteWidget;
  const CustomColorPaletteWidgetView(
      {super.key, required this.colorPaletteWidget});

  @override
  Widget build(BuildContext context) {
    return const Text("Error");
    // String name = "No Name found";
    // if (colorPaletteWidget.value != null &&
    //     colorPaletteWidget.value!.isNotEmpty) {
    //   name = colorPaletteWidget.value!;
    // } else if (colorPaletteWidget.name != null) {
    //   name = colorPaletteWidget.name!;
    // }
    // if (colorPaletteWidget.dataPoint == null) {
    //   return const ListTile(
    //     title: Text("Device not found"),
    //   );
    // }
    // final bloc = DataPointBloc(colorPaletteWidget.dataPoint!);
    // return BlocBuilder<DataPointBloc, DataPointState>(
    //   bloc: bloc,
    //   builder: (context, state) {
    //     String value = state.value.toString();

    //     if (colorPaletteWidget.prefix.trim().isNotEmpty) {
    //       value = value.replaceFirst(colorPaletteWidget.prefix, "");
    //     }
    //     if (value.startsWith("0x")) {
    //       value = value.replaceFirst("0x", "");
    //     }
    //     var regExp = RegExp(r'[A-F]|[0-9]');
    //     value = value.toUpperCase();
    //     if (regExp.allMatches(value).isEmpty ||
    //         (regExp.allMatches(value).length != 6 &&
    //             regExp.allMatches(value).length != 8)) {
    //       return ListTile(
    //         title: Text(name),
    //         trailing: Text("Not supported value: $value"),
    //         onTap: () => colorPickerDialog(
    //             context, bloc, const Color.fromARGB(0, 0, 0, 0)),
    //       );
    //     }
    //     int? alpha;
    //     int? red;
    //     int? green;
    //     int? blue;
    //     if (value.length == 6) {
    //       alpha = 255;
    //       red = int.tryParse(value.substring(0, 2), radix: 16);
    //       green = int.tryParse(value.substring(2, 4), radix: 16);
    //       blue = int.tryParse(value.substring(4, 6), radix: 16);
    //     } else if (value.length == 8) {
    //       alpha = int.tryParse(value.substring(0, 2), radix: 16);
    //       red = int.tryParse(value.substring(2, 4), radix: 16);
    //       green = int.tryParse(value.substring(4, 6), radix: 16);
    //       blue = int.tryParse(value.substring(6, 8), radix: 16);
    //     }

    //     return ListTile(
    //         title: Text(name),
    //         trailing: alpha == null ||
    //                 red == null ||
    //                 blue == null ||
    //                 green == null
    //             ? Text(
    //                 "Currently only hex values are supported: ${state.value}")
    //             : ColorIndicator(
    //                 color: Color.fromARGB(alpha, red, green, blue),
    //               ),
    //         onTap: () async {
    //           Color newColor = await colorPickerDialog(context, bloc,
    //               Color.fromARGB(alpha ?? 0, red ?? 0, green ?? 0, blue ?? 0));
    //           bloc.add(DataPointValueUpdateRequest(
    //               value: colorPaletteWidget.prefix +
    //                   (colorPaletteWidget.alpha == true
    //                       ? newColor.hexAlpha
    //                       : newColor.hex),
    //               oldValue: newColor.hex));
    //         });
    //   },
    // );
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
        enableShadesSelection: colorPaletteWidget.shadesSelection,
        materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
        colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
        colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
        pickersEnabled: colorPaletteWidget.pickersEnabled);
  }
}
