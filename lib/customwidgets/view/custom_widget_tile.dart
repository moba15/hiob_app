import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

import '../../settings/widget_settings/widget_template_settings/cubit/widget_template_list_cubit.dart';
import '../../settings/widget_settings/widget_template_settings/view/template_add_edit_page.dart';
import '../templates/custom_widget_template.dart';

class CustomWidgetTemplateTile extends StatelessWidget {
  final CustomWidgetTemplate customWidget;

  const CustomWidgetTemplateTile({Key? key, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomWidgetType? type = customWidget.customWidget.type;
    print("type " + type.toString());
    return ListTile(
      title: Text(customWidget.name),
      trailing: const Icon(Icons.delete_forever),
      subtitle: Text(type.toString()),
      onTap: ()  {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => TemplateAddPage(
                  customWidgetManager: context.read<WidgetTemplateListCubit>().customWidgetManager,
                  preSelectedTemplate: customWidget,
                )));
      },
    );
  }
}
