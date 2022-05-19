import 'dart:convert';

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
  Map<String, dynamic>? oldJSON;
  final TextEditingController _nameController = TextEditingController();
  CustomWidgetSettingWidget? _customWidgetSettingWidget;
  
  @override
  void initState() {

    _nameController.value = TextEditingValue(text: widget.preSelectedTemplate?.name ?? "");
    _selectedType = widget.preSelectedTemplate?.customWidget.type ?? CustomWidgetType.simpleSwitch;
    _customWidgetSettingWidget = widget.preSelectedTemplate?.customWidget.clone().settingWidget  ?? _selectedType!.settingWidget;
    oldJSON = _customWidgetSettingWidget!.customWidget.toJson();
    super.initState();
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
          if(!_isSaved()) {
            showDialog(context: context, builder: (_) => _SaveDialog(onSave: _save, cancel: () => Navigator.pop(context),));
            return false;
          }
          return true;
        },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Edit Template"),
            actions: [
              IconButton(onPressed: ()  {
                if(!_isSaved()) {
                  showDialog(context: context, builder: (_) => _SaveDialog(
                    onSave: () => {_save(), Navigator.popUntil(context, (route) => route.isFirst)}, cancel: () => Navigator.popUntil(context, (route) => route.isFirst),));
                  return;
                }
                Navigator.popUntil(context, (route) => route.isFirst);

              }, icon: const Icon(Icons.home)),
            ],
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
                    for (CustomWidgetType c in CustomWidgetType.values.where((value) => value != CustomWidgetType.group && value != CustomWidgetType.line))
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
                  controller: _nameController,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(labelText: "Name"),
                ),
              ),
              RepositoryProvider.value(
                  value: widget.customWidgetManager,
                  child: _customWidgetSettingWidget == null ? const Text("Error") : _customWidgetSettingWidget as Widget
              )
            ],
          )),
    );
  }

  bool _isSaved() {
    
    return jsonEncode(oldJSON) == jsonEncode(_customWidgetSettingWidget?.customWidget.toJson()  ?? "[]");
  }

  void _save() {
    if(_nameController.text.isEmpty) {
      return;
    }

    if(_customWidgetSettingWidget != null && _customWidgetSettingWidget!.validate() ) {
      
      
      if(widget.preSelectedTemplate != null) {
        widget.preSelectedTemplate!.customWidget.name = _nameController.text;
        widget.preSelectedTemplate!.customWidget = _customWidgetSettingWidget!.customWidget;
        
        widget.preSelectedTemplate!.name = _nameController.text;
        widget.customWidgetManager.edit(
          template: widget.preSelectedTemplate!
        );
      } else {
        _customWidgetSettingWidget!.customWidget.name = _nameController.text;
        widget.customWidgetManager.save(
            template: CustomWidgetTemplate(
              id: Manager.instance?.getRandString(22) ?? "",
              name: _nameController.text,
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


class _SaveDialog extends StatelessWidget {
  final Function onSave;
  final Function cancel;
  const _SaveDialog({Key? key, required this.onSave, required this.cancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Changes not saved"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("Do you want exit without exit!"),
        ],
      ),
      actions: [
        TextButton(onPressed: () => {Navigator.pop(context), cancel()}, child: const Text("Exit")),
        TextButton(onPressed: () => {Navigator.pop(context), onSave()}, child: const Text("Save")),

      ],
    );
  }
}
