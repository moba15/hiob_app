import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';

import '../../../../manager/customise_manager.dart';

class TemplateAddPage extends StatefulWidget {
  final CustomWidgetManager customWidgetManager;
  final CustomWidgetTemplate? preSelectedTemplate;

  const TemplateAddPage({Key? key, required this.customWidgetManager, this.preSelectedTemplate})
      : super(key: key);

  @override
  State<TemplateAddPage> createState() => _TemplateAddPageState();
}

class _TemplateAddPageState extends State<TemplateAddPage> {
  CustomWidgetType? _selectedType;
  final TextEditingController nameController = TextEditingController();
  
  CustomWidgetSettingWidget? _customWidgetSettingWidget;
  
  @override
  void initState() {
    nameController.value = TextEditingValue(text: widget.preSelectedTemplate?.name ?? "");
    _selectedType = widget.preSelectedTemplate?.customWidget.type ?? CustomWidgetType.simpleSwitch;
    _customWidgetSettingWidget = widget.preSelectedTemplate?.customWidget.settingWidget  ?? _selectedType!.settingWidget;
    super.initState();
  }
  
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Template"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          child: const Icon(Icons.save),
        ),
        body: ListView(

          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownButtonFormField<CustomWidgetType>(
                items: [
                  for (CustomWidgetType c in CustomWidgetType.values.where((value) => value != CustomWidgetType.group))
                    DropdownMenuItem(
                      child: Text(c.name),
                      value: c,
                    )
                ],
                value: _selectedType,
                onChanged: (CustomWidgetType? type) {
                  setState(() {
                    _selectedType = type!;
                    if(widget.preSelectedTemplate == null) {
                      _customWidgetSettingWidget =  _selectedType!.settingWidget;
                    } else {
                      if(_selectedType == widget.preSelectedTemplate!.customWidget.type) {
                        _customWidgetSettingWidget = widget.preSelectedTemplate!.customWidget.settingWidget;
                      } else {
                        _customWidgetSettingWidget =  _selectedType!.settingWidget;
                      }
                    }
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: nameController,
                onChanged: (value) => {},
                decoration: const InputDecoration(labelText: "Name"),
              ),
            ),
            RepositoryProvider.value(
              value: widget.customWidgetManager,
              child: _customWidgetSettingWidget == null ? const Text("Error") : _customWidgetSettingWidget as Widget
            )
          ],
        ));
  }

  void _save() {
    if(nameController.text.isEmpty) {
      return;
    }

    if(_customWidgetSettingWidget != null && _customWidgetSettingWidget!.validate() ) {
      if(widget.preSelectedTemplate != null) {
        widget.preSelectedTemplate!.customWidget.name = nameController.text;
        widget.preSelectedTemplate!.customWidget = _customWidgetSettingWidget!.customWidget;
        widget.preSelectedTemplate!.name = nameController.text;
        widget.customWidgetManager.edit(
          template: widget.preSelectedTemplate!
        );
      } else {
        _customWidgetSettingWidget!.customWidget.name = nameController.text;
        widget.customWidgetManager.save(
            template: CustomWidgetTemplate(
              id: Manager.instance?.getRandString(12) ?? "",
              name: nameController.text,
              customWidget: _customWidgetSettingWidget!.customWidget,
            )
        );
      }
      Navigator.pop(context);
    }
  }
}

class TemplateEditPage extends StatefulWidget {
  final CustomWidgetTemplate template;
  final ScreenManager screenManager;

  const TemplateEditPage(
      {Key? key, required this.template, required this.screenManager})
      : super(key: key);

  @override
  State<TemplateEditPage> createState() => _TemplateEditPageState();
}

class _TemplateEditPageState extends State<TemplateEditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController iconController = TextEditingController();
  TextEditingController indexController = TextEditingController();

  _TemplateEditPageState() {
    nameController.text = widget.template.name;
  }

  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  Widget build(BuildContext context) {
    return const Text("ok");
  }
}