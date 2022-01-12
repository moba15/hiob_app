import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/setting/setting_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main screen"),
        actions: [
          IconButton(onPressed: () => {

          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingScreen()),
          )
          }, icon: const Icon(Icons.settings))
        ],
      ),

      body:  const Text("Coming soon"),


    );
  }
}
