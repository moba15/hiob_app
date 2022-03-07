import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/view/main_screen.dart';

class App extends MaterialApp {
  App({Key? key, required manager})
      : super(
            key: key,
            home: RepositoryProvider<Manager>.value(
              value: Manager(),
              child: const MainScreen(),
            ));
}