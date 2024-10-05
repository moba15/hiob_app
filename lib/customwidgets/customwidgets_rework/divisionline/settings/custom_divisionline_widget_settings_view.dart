import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/utils/theme.dart';

class CustomDivisionlineWidgetSettingsView
    extends CustomWidgetSettingStatefulWidget {
  final CustomDivisionlineWidget customDivisionlineWidget;
  const CustomDivisionlineWidgetSettingsView(
      {Key? key, required this.customDivisionlineWidget})
      : super(key: key);

  @override
  State<CustomDivisionlineWidgetSettingsView> createState() =>
      _CustomDivisionlineWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customDivisionlineWidget;

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
    return customDivisionlineWidget.thickness > 0;
  }
}

class _CustomDivisionlineWidgetSettingsViewState
    extends State<CustomDivisionlineWidgetSettingsView> {
  late CustomWidgetBlocCubit c;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
            child: TextField(
              onChanged: (s) => {
                widget.customDivisionlineWidget.thickness =
                    int.tryParse(s) ?? 3,
                c.update(widget.customDivisionlineWidget)
              },
              decoration: const InputDecoration(labelText: "Thickness"),
              controller: TextEditingController(
                  text: widget.customDivisionlineWidget.thickness.toString()),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          )
        ],
      ),
    );
  }
}
