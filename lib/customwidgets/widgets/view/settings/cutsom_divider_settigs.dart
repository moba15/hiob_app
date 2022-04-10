import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';

class CustomDividerSettings extends CustomWidgetSettingStatelessWidget {
  final CustomDivisionLineWidget customDivisionLineWidget;
  const CustomDividerSettings({Key? key, required this.customDivisionLineWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          TextField(
            onChanged: (s) => {customDivisionLineWidget.thickness = int.tryParse(s) ?? 3},
            decoration: const InputDecoration(labelText: "Thickness"),
            controller: TextEditingController(text: customDivisionLineWidget.thickness.toString()),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),

        ],
      )
    );
  }

  @override
  CustomWidget get customWidget => customDivisionLineWidget;

  @override
  bool validate() {
    return true;
  }

}