import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Settings"),

      ),
      body: ListView  (

        children:  [
          ListTile(
            trailing: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.delete_forever),


            ),
            title: const Text("Screen 1"),
            leading: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),


            ),
          ),

          ListTile(
            trailing: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.delete_forever),


            ),
            title: const Text("Screen 1"),
            leading: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),


            ),
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.delete_forever),


            ),
            title: const Text("Screen 1"),
            leading: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),


            ),
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.delete_forever),


            ),
            title: const Text("Screen 1"),
            leading: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),


            ),
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.delete_forever),


            ),
            title: const Text("Screen 1"),
            leading: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),


            ),
          ),

        ],



      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.add),

      ),
    );
  }
}
