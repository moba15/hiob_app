import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/custompopup/view/settings/cutsom_popupmenu_settings_view.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/utils/app_locallization_shortcut.dart';

import '../../../../manager/customise_manager.dart';

class TemplateAddPage extends StatefulWidget {
  final CustomWidgetManager customWidgetManager;
  final CustomWidgetWrapper? preSelectedTemplate;
  final Function(CustomWidgetWrapper)? onSave;
  final bool Function(CustomWidgetTypeDeprecated)? filter;
  const TemplateAddPage(
      {Key? key,
      required this.customWidgetManager,
      this.preSelectedTemplate,
      this.onSave,
      this.filter})
      : super(key: key);

  @override
  State<TemplateAddPage> createState() => _TemplateAddPageState();
}

class _TemplateAddPageState extends State<TemplateAddPage> {
  final GlobalKey _nameKey = GlobalKey();
  CustomWidgetTypeDeprecated? _selectedType;
  String? _oldJSON;
  final TextEditingController _nameController = TextEditingController();
  CustomWidgetSettingWidget? _customWidgetSettingWidget;
  late CustomWidgetBlocCubit customWidgetBlocCubit;
  @override
  void initState() {
    _nameController.value =
        TextEditingValue(text: widget.preSelectedTemplate?.name ?? "");
    //TODO Refactor Customwidget type
    _selectedType = CustomWidgetTypeDeprecated.values.firstWhere(
      (element) => element.name == widget.preSelectedTemplate?.type?.name,
      orElse: () => CustomWidgetTypeDeprecated.button,
    );
    _customWidgetSettingWidget = widget.preSelectedTemplate?.settingWidget ??
        _selectedType!.settingWidget;
    _oldJSON = jsonEncode(_customWidgetSettingWidget!.deprecated
        ? _customWidgetSettingWidget!.customWidgetDeprecated.toJson()
        : _customWidgetSettingWidget!.customWidget.toJson());

    customWidgetBlocCubit =
        CustomWidgetBlocCubit(customWidget: widget.preSelectedTemplate);
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
        body: BlocProvider(
          create: (_) {
            return customWidgetBlocCubit;
          },
          child: Stack(
            children: [
              _listView(),
            ],
          ),
        ));
  }

  ListView _listView() {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: DropdownButtonFormField<CustomWidgetTypeDeprecated>(
            items: [
              for (CustomWidgetTypeDeprecated c
                  in CustomWidgetTypeDeprecated.values.where((value) =>
                      value != CustomWidgetTypeDeprecated.group &&
                      value != CustomWidgetTypeDeprecated.alertDialog &&
                      (widget.filter == null || widget.filter!(value))))
                DropdownMenuItem(
                  value: c,
                  child: Text(c.name),
                )
            ],
            value: _selectedType,
            onChanged: (CustomWidgetTypeDeprecated? type) {
              setState(() {
                _selectedType = type!;
                if (widget.preSelectedTemplate == null) {
                  _customWidgetSettingWidget = _selectedType!.settingWidget;
                } else {
                  if (_selectedType?.name ==
                      widget.preSelectedTemplate!.type?.name) {
                    _customWidgetSettingWidget =
                        widget.preSelectedTemplate!.settingWidget;
                  } else {
                    _customWidgetSettingWidget = _selectedType!.settingWidget;
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
              onChanged: (value) {
                customWidgetBlocCubit
                    .update(_customWidgetSettingWidget?.customWidget);
                try {
                  _customWidgetSettingWidget?.customWidget.name = value;
                } catch (e) {
                  _customWidgetSettingWidget?.customWidgetDeprecated.name =
                      value;
                }
              },
              decoration: const InputDecoration(labelText: "Name"),
            ),
          ),
        ),
        _TemplateTabBarView(
            customWidgetSettingWidget: _customWidgetSettingWidget),

        /*RepositoryProvider.value(
              value: widget.customWidgetManager,
              child: _customWidgetSettingWidget == null
                  ? const Text("Error")
                  : _customWidgetSettingWidget as Widget)*/
        const Gap(10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                indent: 20.0,
                endIndent: 10.0,
                thickness: 1,
              ),
            ),
            Text(
              "PREVIEW",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Divider(
                indent: 10.0,
                endIndent: 20.0,
                thickness: 1,
              ),
            ),
          ],
        ),
        BlocBuilder<CustomWidgetBlocCubit, int>(
          buildWhen: (previous, current) {
            return true;
          },
          builder: (context, state) {
            return _preViewWidget();
          },
        ),
      ],
    );
  }

  Widget _preViewWidget() {
    if (_customWidgetSettingWidget != null &&
        !_customWidgetSettingWidget!.deprecated &&
        _customWidgetSettingWidget!.validate()) {
      return _customWidgetSettingWidget!.customWidget.widget;
    }
    return Placeholder();
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
        child: ShowCaseWidget(builder: (c) => mainScreen(c)));
  }

  bool _isSaved() {
    if (_customWidgetSettingWidget != null &&
        _customWidgetSettingWidget!.deprecated) {
      return _oldJSON ==
          jsonEncode(
              _customWidgetSettingWidget?.customWidgetDeprecated.toJson() ??
                  "[]");
    } else {
      return _oldJSON ==
          jsonEncode(_customWidgetSettingWidget!.customWidget.toJson());
    }
  }

  void _save() {
    if (_nameController.text.isEmpty) {
      return;
    }

    if (_customWidgetSettingWidget != null &&
        _customWidgetSettingWidget!.validate()) {
      if (widget.preSelectedTemplate != null) {
        //TODO Refector
        if (_customWidgetSettingWidget!.deprecated) {
          //!Support older versions
          widget.preSelectedTemplate!.name = _nameController.text;
          (widget.preSelectedTemplate! as CustomWidgetTemplate).customWidget =
              _customWidgetSettingWidget!.customWidgetDeprecated;

          widget.preSelectedTemplate!.name = _nameController.text;
          if (widget.onSave == null) {
            widget.customWidgetManager
                .edit(template: widget.preSelectedTemplate!);
          } else {
            widget.onSave!(widget.preSelectedTemplate!);
          }
        } else if (!_customWidgetSettingWidget!.deprecated) {
          _customWidgetSettingWidget!.customWidget.name = _nameController.text;

          _customWidgetSettingWidget!.customWidget.name = _nameController.text;
          _customWidgetSettingWidget!.customWidget.id =
              widget.preSelectedTemplate!.id;
          if (widget.onSave == null) {
            //TODO FIX
            widget.customWidgetManager
                .edit(template: _customWidgetSettingWidget!.customWidget);
          } else {
            widget.onSave!(widget.preSelectedTemplate!);
          }
        }
      } else {
        try {
          //TODO
          //!Old version support
          _customWidgetSettingWidget!.customWidgetDeprecated.name =
              _nameController.text;
          if (widget.onSave == null) {
            widget.customWidgetManager.save(
                template: CustomWidgetTemplate(
              id: Manager.instance.getRandString(22),
              name: _nameController.text,
              customWidget: _customWidgetSettingWidget!.customWidgetDeprecated,
            ));
          } else {
            widget.onSave!(CustomWidgetTemplate(
              id: Manager.instance.getRandString(22),
              name: _nameController.text,
              customWidget: _customWidgetSettingWidget!.customWidgetDeprecated,
            ));
          }
        } catch (e) {
          //Template is porbaly new one
          _customWidgetSettingWidget!.customWidget.name = _nameController.text;
          _customWidgetSettingWidget!.customWidget.id =
              Manager.instance.getRandString(22);
          if (widget.onSave == null) {
            widget.customWidgetManager
                .save(template: _customWidgetSettingWidget!.customWidget);
          } else {
            widget.onSave!(_customWidgetSettingWidget!.customWidget);
          }
        }
      }
      Navigator.pop(context);
    }
  }
}

class _TemplateTabBarView extends StatefulWidget {
  final CustomWidgetSettingWidget? customWidgetSettingWidget;

  const _TemplateTabBarView({
    Key? key,
    required this.customWidgetSettingWidget,
  }) : super(key: key);

  @override
  State<_TemplateTabBarView> createState() => __TemplateTabBarViewState();
}

class __TemplateTabBarViewState extends State<_TemplateTabBarView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late bool hasPopupmenu = false;
  int currentTab = 0;
  @override
  void initState() {
    hasPopupmenu = !(widget.customWidgetSettingWidget?.deprecated ?? true) &&
        widget.customWidgetSettingWidget?.customWidget is CustomWidget &&
        (widget.customWidgetSettingWidget?.customWidget as CustomWidget)
            .isAbleToPopupMenu;
    _tabController = TabController(length: hasPopupmenu ? 2 : 1, vsync: this);
    _tabController.addListener(() {
      changeTab(_tabController.index);
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant _TemplateTabBarView oldWidget) {
    hasPopupmenu = !(widget.customWidgetSettingWidget?.deprecated ?? true) &&
        widget.customWidgetSettingWidget?.customWidget is CustomWidget &&
        (widget.customWidgetSettingWidget?.customWidget as CustomWidget)
            .isAbleToPopupMenu;
    currentTab = 0;
    _tabController.dispose();
    _tabController = TabController(length: hasPopupmenu ? 2 : 1, vsync: this);
    _tabController.addListener(() {
      changeTab(_tabController.index);
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _tabView();
  }

  Widget _tabView() {
    return Column(children: [_tabBar(), _tabBody()]);
  }

  TabBar _tabBar() {
    return TabBar(controller: _tabController, tabs: [
      const Tab(
        text: "Main",
      ),
      if (hasPopupmenu)
        const Tab(
          text: "PopUpMenu",
        )
    ]);
  }

  Widget _tabBody() {
    if (currentTab == 0) {
      if (widget.customWidgetSettingWidget == null) {
        return const Text("Error 404");
      }
      return RepositoryProvider.value(
          value: Manager().customWidgetManager,
          child: widget.customWidgetSettingWidget! as Widget);
    } else if (currentTab == 1) {
      if (widget.customWidgetSettingWidget!.customWidget.customPopupmenu ==
          null) {
        widget.customWidgetSettingWidget!.customWidget.customPopupmenu =
            CustomPopupmenu(customWidgets: []);
      }
      return CustomPopupmenuSettingsView(
          customWidget: widget.customWidgetSettingWidget!.customWidget,
          customPopupmenu:
              widget.customWidgetSettingWidget!.customWidget.customPopupmenu ??
                  CustomPopupmenu(customWidgets: []));
    }

    return const Text("Error 404");
  }

  void changeTab(int index) {
    setState(() {
      currentTab = index;
    });
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
