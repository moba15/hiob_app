import 'package:flutter/gestures.dart';
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
          manager.managerStatusStreamController.sink
              .add(ManagerStatus.finished);
        },
        child: const Icon(Icons.visibility),
      ),
      appBar: AppBar(
        title: Text(
            "What's new? ${manager.versionNumber}(${manager.buildNumber})"),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text(
                  "Changelog ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "Version: ${manager.versionNumber}",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),

          /*const Text("Widgets", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Added the Graph Widget (only use this widget if you backedup your current state):"),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text("If you use the sql Adapter you can now use this Widget to display a Graph"),
                ),


              ],
            ),
          ),*/

          /* const Text(
            "Notifications",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "- Logging for notification bug finding, see general settings"),
                Text("- Clicking on Conncetion Status now will open the app"),
                Text("- AES support added"),
                Text("- Notification log now available (beta)"),
                Text("- Fixed some bugs"),
              ],
            ),
          ), */
          const Text(
            "Templates",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "- Added network media player (only Android with google services)"),
                Text("- Added color picker")
              ],
            ),
          ),
          const Text(
            "General",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "There is currently running a poll on GitHub under: github.com/moba15/hiob_app/discussions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
