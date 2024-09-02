import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';
import 'package:smart_home/utils/theme.dart';

class CustomPopupmenuSettingsView extends StatefulWidget {
  final CustomWidget customWidget;
  final CustomPopupmenu customPopupmenu;
  const CustomPopupmenuSettingsView(
      {Key? key, required this.customWidget, required this.customPopupmenu})
      : super(key: key);

  @override
  State<CustomPopupmenuSettingsView> createState() =>
      _CustomPopupmenuSettingsViewState();
}

class _CustomPopupmenuSettingsViewState
    extends State<CustomPopupmenuSettingsView> {
  late CustomWidgetBlocCubit c;
  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Column(
      children: [
        InputFieldContainer.inputContainer(
            child: Text(
          "Widgtes",
          style: TextStyle(fontSize: 15),
        )),
        ReorderableListView(
          shrinkWrap: true,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              widget.customPopupmenu.reorder(oldIndex, newIndex);
            });
          },
          children: [
            ..._widgetList(),
          ],
        ),
        _addWidgetButton()
      ],
    );
  }

  List<Widget> _widgetList() {
    List<Widget> list = [];
    for (CustomWidget customWidget in widget.customPopupmenu.customWidgets) {
      list.add(Dismissible(
          key: ValueKey(customWidget.id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Icon(Icons.delete_forever),
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Icon(Icons.delete_forever),
            ),
          ),
          onDismissed: (d) {
            setState(() {
              c.update(widget.customWidget);
              widget.customPopupmenu.customWidgets.remove(customWidget);
            });
          },
          child: CustomWidgetTemplateTile(
              customWidget: customWidget,
              customWidgetManager: Manager().customWidgetManager,
              toggleSelect: () {})));
    }
    return list;
  }

  Widget _addWidgetButton() {
    return OutlinedButton(
        onPressed: _onAddPress, child: const Text("Add Widget"));
  }

  void _onAddPress() {
    //TODO Open
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return TemplateAddPage(
          customWidgetManager: Manager().customWidgetManager,
          onSave: _onWidgetSave,
          filter: (CustomWidgetTypeDeprecated p0) {
            return p0 == CustomWidgetTypeDeprecated.input ||
                p0 == CustomWidgetTypeDeprecated.button;
          },
        );
      },
    ));
  }

  _onWidgetSave(CustomWidgetWrapper p1) {
    if (p1 is CustomWidget) {
      setState(() {
        widget.customPopupmenu.customWidgets.add(p1);
      });
      c.update(widget.customWidget);
    } else {
      throw ErrorDescription(
          "This is only supported for the new type of widgets");
    }
  }
}
