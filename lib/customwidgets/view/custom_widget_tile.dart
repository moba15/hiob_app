import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomWidgetTile extends StatelessWidget {
  final CustomWidget customWidget;

  const CustomWidgetTile({Key? key, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customWidget.type == null
          ? "Error 301"
          : customWidget.type.toString()),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
    );
  }
}
