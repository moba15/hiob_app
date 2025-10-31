import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/view/screen_list_page.dart';

class ScreenListSettingsScreen extends StatelessWidget {
  final ScreenManager screenManager;

  const ScreenListSettingsScreen({super.key, required this.screenManager});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: screenManager,
      child: const ScreenListPage(),
    );
  }
}
