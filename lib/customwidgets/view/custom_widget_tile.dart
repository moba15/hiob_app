import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

import '../templates/custom_widget_template.dart';

class CustomWidgetTemplateTile extends StatelessWidget {
  final CustomWidgetTemplate customWidget;

  const CustomWidgetTemplateTile({Key? key, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomWidgetType? type = customWidget.customWidget.type;
    return ListTile(
      title: Text(customWidget.name),
      trailing: const Icon(Icons.delete_forever),
      subtitle: Text(type.toString()),
    );
  }
}
