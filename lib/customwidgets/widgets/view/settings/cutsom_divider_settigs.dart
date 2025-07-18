import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/utils/theme.dart';

class CustomDividerSettings extends CustomWidgetSettingStatelessWidget {
  final CustomDivisionLineWidget customDivisionLineWidget;
  const CustomDividerSettings(
      {super.key, required this.customDivisionLineWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            InputFieldContainer.inputContainer(
              child: TextField(
                onChanged: (s) =>
                    {customDivisionLineWidget.thickness = int.tryParse(s) ?? 3},
                decoration: const InputDecoration(labelText: "Thickness"),
                controller: TextEditingController(
                    text: customDivisionLineWidget.thickness.toString()),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            )
          ],
        ));
  }

  @override
  CustomWidgetDeprecated get customWidgetDeprecated => customDivisionLineWidget;
  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  bool validate() {
    return true;
  }

  @override
  // TODO: implement showKeys
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  // TODO: implement deprecated
  bool get deprecated => true;
}
