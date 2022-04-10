import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';

class CustomGroupWidgetSettingsPage extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;
  const CustomGroupWidgetSettingsPage({Key? key, required this.customGroupWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomGroupWidget clone = customGroupWidget.clone();
    CustomGroupWidgetSettings customGroupWidgetSettings = CustomGroupWidgetSettings(customGroupWidget: clone,);
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Edit Group"),

          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {
              if(customGroupWidgetSettings.validate())
                save(context, clone)
            },
            child: const Icon(Icons.save),
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: customGroupWidgetSettings,
          )
      ),
      onWillPop: () async {
        return true;
      },
    );
  }

  void save(BuildContext context, CustomGroupWidget clone) {
    customGroupWidget.name = clone.name;
    customGroupWidget.templates = clone.templates;
    Manager.instance!.screenManager.update();
    Navigator.pop(context);
  }
}


class CustomGroupWidgetSettings extends CustomWidgetSettingStatefulWidget {
  final CustomGroupWidget customGroupWidget;
  const CustomGroupWidgetSettings({Key? key, required this.customGroupWidget}) : super(key: key);

  @override
  State<CustomGroupWidgetSettings> createState() => _CustomGroupWidgetSettingsState();

  @override
  CustomWidget get customWidget => customGroupWidget;

  @override
  bool validate() {
    return customGroupWidget.name != null && customGroupWidget.name!.isNotEmpty;
  }


}

class _CustomGroupWidgetSettingsState extends State<CustomGroupWidgetSettings> {
  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    _nameController.text = widget.customGroupWidget.name ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          onChanged: (v) => widget.customGroupWidget.name = v,
          controller: _nameController,
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(labelText: "Group Name"),
        ),
        Container(height: 15,),
       Row(
         children: [
           const Text("Templates:", style: TextStyle(fontSize: 17),),
           Container(width: 16,),
           TextButton(
             onPressed: ()  => {
               showDialog(
                   context: context,
                   builder: (context) => AddTemplateAlertDialog(
                     screenManager: Manager.instance!.screenManager,
                     customGroupWidget: widget.customGroupWidget,
                     onAdded: (templates)  {
                       setState(() {
                         widget.customGroupWidget.addTemplates(templates);
                       });
                     },
                   )
               )
             },
             child: const Text("Add"),
           ),

         ],
       ),
        Expanded(
          child: ReorderableListView.builder(

            onReorder: (oldIndex, newIndex)  {
              setState(() {
                widget.customGroupWidget.reorder(oldIndex: oldIndex, newIndex: newIndex);
              });

            },
            itemCount: widget.customGroupWidget.templates.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                child: CustomWidgetTemplateTile(customWidget: widget.customGroupWidget.templates[index], customWidgetManager: Manager.instance!.customWidgetManager),
                onDismissed: (d)  {
                  setState(() {
                    widget.customGroupWidget.removeTemplate(widget.customGroupWidget.templates[index]);
                  });
                },
                direction: DismissDirection.endToStart,
                key: ValueKey(widget.customGroupWidget.templates[index].id),
              );
            },
          ),
        ),




      ],
    );
  }
}



class AddTemplateAlertDialog extends StatefulWidget {
  final CustomGroupWidget customGroupWidget;
  final ScreenManager screenManager;
  final Function(List<CustomWidgetTemplate>)  onAdded;
  const AddTemplateAlertDialog(
      {Key? key, required this.customGroupWidget, required this.screenManager, required this.onAdded})
      : super(key: key);

  @override
  State<AddTemplateAlertDialog> createState() => _AddTemplateAlertDialogState();
}

class _AddTemplateAlertDialogState extends State<AddTemplateAlertDialog> {
  List<CustomWidgetTemplate> selected = [];

  @override
  Widget build(BuildContext context) {
    List<CustomWidgetTemplate> templates =
        widget.screenManager.manager.customWidgetManager.templates;
    return AlertDialog(
        title: const Text("Select Widget Template"),
        actions: [
          TextButton(onPressed: cancel, child: const Text("Cancel")),
          TextButton(onPressed: add, child: const Text("Add")),
        ],
        content: Container(
          height: 500,
          width: 100,
          child: ListView(
            children: [
              for (CustomWidgetTemplate t in templates)
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
                  subtitle: Text(t.customWidget.type.toString()),
                )
            ],
          ),
        ));
  }

  void add() {
    widget.onAdded(selected);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }
}


