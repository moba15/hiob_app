import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';
import 'package:smart_home/settings/view/main_screen.dart';

class App extends MaterialApp {
  App(
      {Key? key,
      required Manager manager,
      required ScreenManager screenManager})
      : super(
            key: key,
            home: RepositoryProvider<Manager>.value(
                value: manager,
                child: BlocProvider(
                  child: const MainPage(),
                  create: (_) => ScreenListCubit(screenManager: screenManager)
                    ..fetchList(),
                )));
}
