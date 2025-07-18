import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

class TemplateSelectionAlertDialog extends StatefulWidget {
  final ScreenManager screenManager;
  final List<dynamic> selected;
  final Function(List<CustomWidgetWrapper>) onSelect;
  final bool Function(CustomWidgetWrapper)? filter;
  final String selectButton;

  const TemplateSelectionAlertDialog({
    super.key,
    required this.screenManager,
    required this.onSelect,
    required this.selected,
    this.filter,
    this.selectButton = "Add",
  });

  @override
  State<TemplateSelectionAlertDialog> createState() =>
      _TemplateSelectionAlertDialogState();
}

class _TemplateSelectionAlertDialogState
    extends State<TemplateSelectionAlertDialog> {
  List<CustomWidgetWrapper> selected = [];

  @override
  Widget build(BuildContext context) {
    List<CustomWidgetWrapper> templates = List.of(
      widget.screenManager.manager.customWidgetManager.templates,
    );

    templates.removeWhere((element) => widget.selected.contains(element));
    return AlertDialog(
      title: Text(
        getAppLocalizations(context).select_widget_template_alert_title,
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: Text(getAppLocalizations(context).cancel),
        ),
        TextButton(onPressed: add, child: Text(widget.selectButton)),
      ],
      content: SizedBox(
        child: Column(
          children: [
            for (CustomWidgetTypeDeprecated type
                in CustomWidgetTypeDeprecated.values.where(
                  (element) => element != CustomWidgetTypeDeprecated.group,
                ))
              if (templates.any(
                (element) =>
                    element.type?.name == type.name &&
                    (widget.filter == null || widget.filter!(element)),
              ))
                ExpansionTile(
                  trailing: Checkbox(
                    value: templates
                        .where(
                          (element) =>
                              element.type?.name == type.name &&
                              (widget.filter == null ||
                                  widget.filter!(element)),
                        )
                        .where((element) => selected.contains(element))
                        .isNotEmpty,
                    onChanged: (b) {
                      setState(() {
                        templates
                            .where(
                              (element) =>
                                  element.type?.name == type.name &&
                                  (widget.filter == null ||
                                      widget.filter!(element)),
                            )
                            .forEach((element) {
                              if (b ?? false) {
                                selected.add(element);
                              } else {
                                selected.remove(element);
                              }
                            });
                      });
                    },
                  ),
                  title: Text(
                    "${type.name} (${templates.where((element) => element.type?.name == type.name).length})",
                  ),
                  children: [
                    for (CustomWidgetWrapper t in templates.where(
                      (element) =>
                          element.type?.name == type.name &&
                          (widget.filter == null || widget.filter!(element)),
                    ))
                      ListTile(
                        selected: selected.contains(t),
                        leading: Checkbox(
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selected.add(t);
                              } else {
                                selected.remove(t);
                              }
                            });
                          },
                          value: selected.contains(t),
                        ),
                        title: Text(t.name),
                        subtitle: Text(t.type?.name ?? "Error"),
                      ),
                  ],
                ),
          ],
        ),
      ),
      scrollable: true,
    );
  }

  void add() {
    widget.onSelect(selected);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}
