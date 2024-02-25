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

          const Text(
            "Other",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Connection to IoBroker:"),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text(
                      "-You can now choose between wss or AES encryption"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text(
                    "-For this feature you need the new Adapater version (0.0.60-1)",
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(text: "- For better explaination look at "),
                        TextSpan(
                          text: "https://github.com/moba15/ioBroker.hiob",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
