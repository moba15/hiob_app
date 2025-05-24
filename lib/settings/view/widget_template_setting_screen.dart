import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/customise_manager.dart';

import '../widget_settings/widget_template_settings/view/widget_template_list_page.dart';

class WidgetTemplateSettingScreen extends MaterialApp {
  WidgetTemplateSettingScreen({super.key, required CustomWidgetManager manager})
      : super(
          home: RepositoryProvider.value(
              value: manager,
              child: WidgetTemplateListPage(
                customWidgetManager: manager,
              )),
        );
}
