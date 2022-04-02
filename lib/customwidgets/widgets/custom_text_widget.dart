import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customAttributes/custom_attributes.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/view/SimpleTextWidgetView.dart';
import 'package:smart_home/manager/customise_manager.dart';

class CustomTextWidget extends CustomWidget {
  static const CustomWidgetType typeID = CustomWidgetType.text;
  CustomTextAttribute? text;

  CustomTextWidget({required this.text, required name})
      : super(name: name, type: typeID, settings: {"text": text?.toJson()});

  CustomTextWidget.edit() : super.edit();

  @override
  Map<String, dynamic> toJson() => {
        "type": CustomWidgetType.text.toString(),
        "text": text,
      };

  factory CustomTextWidget.fromJson(Map<String, dynamic> json) =>
      CustomTextWidget(
        text: CustomTextAttribute(data: "assayed"),
        name: json["name"], //TODO: Finish From JSON ZCgRaLnf2Xsy5wGQN2pD
      );

  Widget get settingWidget => CustomTextWidgetSettingWidget(
        customTextWidget: this,
      );

  @override
  Widget get widget => SimpleTextWidgetView(customTextWidget: this);
}

class CustomTextWidgetSettingWidget extends StatelessWidget {
  final TextEditingController valueController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final CustomTextWidget customTextWidget;

  CustomTextWidgetSettingWidget({Key? key, required this.customTextWidget})
      : super(key: key);

  void _save(CustomWidgetManager customWidgetManager) {
    customWidgetManager.save(CustomWidgetTemplate(
        name: nameController.text,
        id: customWidgetManager.manager.getRandString(12),
        customWidget: CustomTextWidget(
            name: nameController.text,
            text: CustomTextAttribute(data: valueController.text))));
  }

  @override
  Widget build(BuildContext context) {
    CustomWidgetManager customWidgetManager =
        context.read<CustomWidgetManager>();

    return Column(
      children: [
        TextField(
          controller: nameController,
          onChanged: (value) => customTextWidget.name = nameController.text,
          decoration: const InputDecoration(hintText: "Name"),
        ),
        TextField(
          controller: valueController,
          onChanged: (value) => customTextWidget.text?.data = value,
          decoration: const InputDecoration(hintText: "Value"),
        ),
        ElevatedButton(
            onPressed: () => _save(customWidgetManager),
            child: const Text("Save")),
      ],
    );
  }
}
