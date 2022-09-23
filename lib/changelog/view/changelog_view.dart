import 'package:flutter/material.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';

class ChangeLogScreen extends StatelessWidget {
  final Manager manager;
  const ChangeLogScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          manager.status = ManagerStatus.finished;
          manager.managerStatusStreamController.sink.add(ManagerStatus.finished);
        },
        child: const Icon(Icons.visibility),

      ),
      appBar: AppBar(
        title: Text("What's new? " + manager.versionNumber + "(" + manager.buildNumber + ")"),
      ),
      body: ListView(

        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text("Changelog ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text("Version: " + manager.versionNumber, style: const TextStyle(fontWeight: FontWeight.normal),)
              ],
            ),
          ),
          const Text("Bugs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("- Some smaller Bugfixes"),
                Text("- Fixed some performance issues"),

              ],
            ),
            margin: const EdgeInsets.only(top: 3, left: 10),
          ),
          const Text("Widgets", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Updated the WebView Widget:"),
                Container(
                  child: const Text("You can now select a DataPoint to update the displayed Website"),
                  margin: const EdgeInsets.only(left: 15),
                ),
                const Text("- Advanced Widget:"),
                Container(
                  child: const Text("You can setup a custom Popup-Menu which will appear if you press down the Widget for a longer moment"),
                  margin: const EdgeInsets.only(left: 15),
                )

              ],
            ),
            margin: const EdgeInsets.only(top: 3, left: 10),
          ),

          const Text("Other", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
        ],
      ),
    );
  }
}
