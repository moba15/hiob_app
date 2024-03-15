import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/manager/customise_manager.dart';

import '../../settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';
import '../widgets/view/settings/templates/custom_widget_template.dart';

class CustomWidgetTemplateTile extends StatelessWidget {
  final CustomWidgetTemplate customWidget;
  final CustomWidgetManager customWidgetManager;
  final Function(CustomWidgetTemplate)? onSave;
  final bool selectedMode;
  final bool selected;
  final Function() toggleSelect;
  const CustomWidgetTemplateTile(
      {Key? key,
      required this.customWidget,
      required this.customWidgetManager,
      required this.toggleSelect,
      this.selectedMode = false,
      this.selected = false,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomWidgetType? type = customWidget.customWidget.type;
    return ListTile(
      title: Text(customWidget.name),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      subtitle: Text(type?.name ?? "Error"),
      selected: selected,
      leading: selectedMode
          ? Checkbox(value: selected, onChanged: (_) => toggleSelect())
          : null,
      onLongPress: toggleSelect,
      onTap: () {
        if (selectedMode) {
          toggleSelect();
          return;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => TemplateAddPage(
                      customWidgetManager: customWidgetManager,
                      preSelectedTemplate: customWidget,
                      onSave: onSave,
                    )));
      },
    );
  }
}
