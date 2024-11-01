import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/utils/theme.dart';

class CustomLabelThemeSettings extends StatefulWidget {
  final LabelTheme labelTheme;
  const CustomLabelThemeSettings({Key? key, required this.labelTheme})
      : super(key: key);

  @override
  State<CustomLabelThemeSettings> createState() =>
      _CustomLabelThemeSettingsState();
}

class _CustomLabelThemeSettingsState extends State<CustomLabelThemeSettings> {
  late TextEditingController _fontSizeController;
  late CustomWidgetBlocCubit c;
  @override
  void initState() {
    _fontSizeController = TextEditingController(
        text: widget.labelTheme.labelFonSize == null
            ? ""
            : widget.labelTheme.labelFonSize.toString());

    super.initState();
  }

  @override
  void dispose() {
    _fontSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return InputFieldContainer.inputContainer(
        child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ExpansionTile(title: const Text("General"), children: [
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: _labelTextSize(),
                  ),
                  const Gap(5),
                  Expanded(child: _labelFontWeightSelection())
                ],
              ),
              _labelColorPicker(context)
            ])));
  }

  DropdownButtonFormField<FontWeight> _labelFontWeightSelection() {
    return DropdownButtonFormField<FontWeight>(
      items: const [
        DropdownMenuItem(
          value: FontWeight.w300,
          child: Text("w300"),
        ),
        DropdownMenuItem(
          value: FontWeight.normal,
          child: Text("Normal"),
        ),
        DropdownMenuItem(
          value: FontWeight.w600,
          child: Text("w600"),
        ),
        DropdownMenuItem(
          value: FontWeight.bold,
          child: Text("Bold"),
        ),
        DropdownMenuItem(
          value: FontWeight.w800,
          child: Text("w800"),
        ),
        DropdownMenuItem(
          value: FontWeight.w900,
          child: Text("w900"),
        ),
      ],
      value: widget.labelTheme.labelFontWeight ?? FontWeight.normal,
      onChanged: (value) {
        widget.labelTheme.labelFontWeight = value;
        c.update(null);
      },
      decoration: const InputDecoration(label: Text("Label font weight")),
    );
  }

  TextField _labelTextSize() {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: _fontSizeController,
      decoration: const InputDecoration(label: Text("Label Text Size")),
      onChanged: (value) {
        widget.labelTheme.labelFonSize = double.tryParse(value);
        c.update(null);
      },
    );
  }

  ListTile _labelColorPicker(BuildContext context) {
    return ListTile(
      subtitle: const Text("Not set"),
      title: Row(
        children: [
          const Text("Label text color"),
          TextButton(
              onPressed: () {
                setState(() {
                  widget.labelTheme.labelColor = null;
                });
                c.update(null);
              },
              child: const Text("Reset")),
        ],
      ),
      onTap: () async {
        Color color = await showColorPickerDialog(
            context,
            widget.labelTheme.labelColor ??
                (Theme.of(context).textTheme.headlineLarge?.color ??
                    Colors.black));
        setState(() {
          widget.labelTheme.labelColor = color;
        });
        c.update(null);
      },
      trailing: ColorIndicator(
        color: widget.labelTheme.labelColor ??
            (Theme.of(context).textTheme.headlineLarge?.color ?? Colors.black),
      ),
    );
  }
}
