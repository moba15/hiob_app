import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/view/screen_list_page.dart';

class ScreenListSettingsScreen extends MaterialApp {
  ScreenListSettingsScreen({Key? key, required ScreenManager manager}) : super(key: key,
    home: RepositoryProvider.value(value: manager, child: const ScreenListPage()),

  );


}