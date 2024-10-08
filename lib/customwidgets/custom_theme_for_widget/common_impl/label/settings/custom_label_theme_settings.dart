import 'package:flutter/material.dart';
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
        child: ExpansionTile(
      title: const Text("General"),
      children: [
        const Gap(10),
        TextField(
          controller: _fontSizeController,
          decoration: const InputDecoration(label: Text("Label Text Size")),
          onChanged: (value) {
            c.update(null);
            widget.labelTheme.labelFonSize = double.tryParse(value);
          },
        ),
        Placeholder()
      ],
    ));
  }
}
