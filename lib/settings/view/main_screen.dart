import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';

import 'main_settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Manager manager = context.read<Manager>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main screen"),
        actions: [
          IconButton(onPressed: () => {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainSettingsScreen(manager: manager)),
            )
          }, icon: const Icon(Icons.settings))
        ],
      ),

      body:  const Text("Coming soon"),


    );
  }
}

