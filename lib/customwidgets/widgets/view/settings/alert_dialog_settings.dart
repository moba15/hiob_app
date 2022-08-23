import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/manager/manager.dart';

import '../../../../settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';
import '../../../custom_widget.dart';

class AlertDialogSettings extends CustomWidgetSettingStatefulWidget {
  final CustomAlertDialogWidget customAlertDialogWidget;
  const AlertDialogSettings({Key? key, required this.customAlertDialogWidget}) : super(key: key);

  @override
  State<AlertDialogSettings> createState() => _AlertDialogSettingsState();

  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => customAlertDialogWidget;

  @override
  bool validate() {
    return customAlertDialogWidget.name != null;
  }

  @override
  // TODO: implement showKeys
  List<GlobalKey<State<StatefulWidget>>> get showKeys => throw UnimplementedError();
}

class _AlertDialogSettingsState extends State<AlertDialogSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Title", labelText: "Title"),
          initialValue: widget.customAlertDialogWidget.name,
          onChanged: (v) => {
            widget.customAlertDialogWidget.name = v,
            if(v.isEmpty)
              widget.customAlertDialogWidget.name = null,
          },
        ),
        ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            if(oldIndex<newIndex) {
              newIndex--;
            }
            CustomWidgetTemplate tmp = widget.customAlertDialogWidget.templates![oldIndex];
            widget.customAlertDialogWidget.templates!.removeAt(oldIndex);
            widget.customAlertDialogWidget.templates!.add(tmp);
            widget.customAlertDialogWidget.templates!.insert(newIndex, tmp);
            widget.customAlertDialogWidget.templates!.removeLast();
            setState(() {

            });




          },
          physics : const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            for(CustomWidgetTemplate template in  widget.customAlertDialogWidget.templates ?? [])
              Dismissible(
                background: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerRight,
                ),
                direction: DismissDirection.endToStart,
                key: ValueKey(template),
                child: CustomWidgetTemplateTile(
                  customWidget: template,
                  customWidgetManager: Manager.instance!.customWidgetManager,
                  onSave: (_)  {
                    setState(() {

                    });
                  },
                ),
                onDismissed: (d)  {
                  setState(() {
                    widget.customAlertDialogWidget.templates?.remove(template);
                  });
                },
              ),
          ],
        ),

        ElevatedButton(
            onPressed: ()  {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => TemplateAddPage(
                      customWidgetManager:Manager.instance!.customWidgetManager ,
                      onSave: (template) {
                        setState(() {
                          if(widget.customAlertDialogWidget.templates == null) {
                            widget.customAlertDialogWidget.templates = [
                              template
                            ];
                          }
                          else {
                            widget.customAlertDialogWidget.templates!.add(template);
                          }
                        });
                      },
                    )));
            },
            child: const Text("Add Widget to Dialog")
        )
      ],
    );
  }
}
