import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

import '../../../../manager/customise_manager.dart';

class TemplateAddPage extends StatefulWidget {
  final CustomWidgetManager customWidgetManager;
  final CustomWidgetTemplate? preSelectedTemplate;
  final Function(CustomWidgetTemplate)? onSave;

  const TemplateAddPage(
      {Key? key,
      required this.customWidgetManager,
      this.preSelectedTemplate,
      this.onSave})
      : super(key: key);

  @override
  State<TemplateAddPage> createState() => _TemplateAddPageState();
}

class _TemplateAddPageState extends State<TemplateAddPage> {
  final GlobalKey _nameKey = GlobalKey();
  CustomWidgetType? _selectedType;
  String? _oldJSON;
  final TextEditingController _nameController = TextEditingController();
  CustomWidgetSettingWidget? _customWidgetSettingWidget;

  @override
  void initState() {
    _nameController.value =
        TextEditingValue(text: widget.preSelectedTemplate?.name ?? "");
    _selectedType = widget.preSelectedTemplate?.customWidget.type ??
        CustomWidgetType.simpleSwitch;
    _customWidgetSettingWidget =
        widget.preSelectedTemplate?.customWidget.clone().settingWidget ??
            _selectedType!.settingWidget;
    _oldJSON = jsonEncode(_customWidgetSettingWidget!.customWidget.toJson());
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Widget mainScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getAppLocalizations(context).edit_template_page_title),
          actions: [
            IconButton(
                tooltip: "Help: ${_selectedType?.name ?? ""}",
                onPressed: () {
                  if (_customWidgetSettingWidget != null) {
                    ShowCaseWidget.of(context)
                        .startShowCase(_customWidgetSettingWidget!.showKeys);
                  }
                },
                icon: const Icon(Icons.help_outline)),
            IconButton(
              onPressed: () {
                if (!_isSaved()) {
                  showDialog(
                      context: context,
                      builder: (_) => _SaveDialog(
                            onSave: () => {
                              _save(),
                              Navigator.popUntil(
                                  context, (route) => route.isFirst)
                            },
                            cancel: () => Navigator.popUntil(
                                context, (route) => route.isFirst),
                          ));
                  return;
                }
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home),
              tooltip: "Go Home",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          child: const Icon(Icons.save),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: DropdownButtonFormField<CustomWidgetType>(
                items: [
                  for (CustomWidgetType c in CustomWidgetType.values.where(
                      (value) =>
                          value != CustomWidgetType.group &&
                          value != CustomWidgetType.alertDialog))
                    DropdownMenuItem(
                      value: c,
                      child: Text(c.name),
                    )
                ],
                value: _selectedType,
                onChanged: (CustomWidgetType? type) {
                  setState(() {
                    _selectedType = type!;
                    if (widget.preSelectedTemplate == null) {
                      _customWidgetSettingWidget = _selectedType!.settingWidget;
                    } else {
                      if (_selectedType ==
                          widget.preSelectedTemplate!.customWidget.type) {
                        _customWidgetSettingWidget = widget
                            .preSelectedTemplate!.customWidget.settingWidget;
                      } else {
                        _customWidgetSettingWidget =
                            _selectedType!.settingWidget;
                      }
                    }
                  });
                },
              ),
            ),
            Showcase(
              key: _nameKey,
              title: "Name",
              description: "Der Name des Templates",
              showArrow: true,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                child: TextField(
                  controller: _nameController,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(labelText: "Name"),
                ),
              ),
            ),
            RepositoryProvider.value(
                value: widget.customWidgetManager,
                child: _customWidgetSettingWidget == null
                    ? const Text("Error")
                    : _customWidgetSettingWidget as Widget)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (!_isSaved()) {
            showDialog(
                context: context,
                builder: (_) => _SaveDialog(
                      onSave: _save,
                      cancel: () => Navigator.pop(context),
                    ));
            return false;
          }
          return true;
        },
        child: ShowCaseWidget(
          builder: Builder(
            builder: (c) => mainScreen(c),
          ),
        ));
  }

  bool _isSaved() {
    return _oldJSON ==
        jsonEncode(_customWidgetSettingWidget?.customWidget.toJson() ?? "[]");
  }

  void _save() {
    if (_nameController.text.isEmpty) {
      return;
    }

    if (_customWidgetSettingWidget != null &&
        _customWidgetSettingWidget!.validate()) {
      if (widget.preSelectedTemplate != null) {
        widget.preSelectedTemplate!.customWidget.name = _nameController.text;
        widget.preSelectedTemplate!.customWidget =
            _customWidgetSettingWidget!.customWidget;

        widget.preSelectedTemplate!.name = _nameController.text;
        if (widget.onSave == null) {
          widget.customWidgetManager
              .edit(template: widget.preSelectedTemplate!);
        } else {
          widget.onSave!(widget.preSelectedTemplate!);
        }
      } else {
        _customWidgetSettingWidget!.customWidget.name = _nameController.text;
        if (widget.onSave == null) {
          widget.customWidgetManager.save(
              template: CustomWidgetTemplate(
            id: Manager.instance.getRandString(22) ?? "",
            name: _nameController.text,
            customWidget: _customWidgetSettingWidget!.customWidget,
          ));
        } else {
          widget.onSave!(CustomWidgetTemplate(
            id: Manager.instance.getRandString(22) ?? "",
            name: _nameController.text,
            customWidget: _customWidgetSettingWidget!.customWidget,
          ));
        }
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

  const _SaveDialog({Key? key, required this.onSave, required this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(getAppLocalizations(context).not_saved_alert_title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(getAppLocalizations(context).want_to_exit_alert),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => {Navigator.pop(context), cancel()},
            child: Text(getAppLocalizations(context).exit)),
        TextButton(
            onPressed: () => {Navigator.pop(context), onSave()},
            child: Text(getAppLocalizations(context).save)),
      ],
    );
  }
}
