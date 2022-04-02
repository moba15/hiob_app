import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/custom_text_widget.dart';

class SimpleTextWidgetView extends StatelessWidget {
  final CustomTextWidget customTextWidget;

  const SimpleTextWidgetView({Key? key, required this.customTextWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customTextWidget.text?.data ?? "null"),
    );
  }
}
