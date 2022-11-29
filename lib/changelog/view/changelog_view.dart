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
                Text("- You should now be able to update the new Devices in IoBroker Settings"),

              ],
            ),
            margin: const EdgeInsets.only(top: 3, left: 10),
          ),
          const Text("Widgets", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Added the Graph Widget (only use this widget if you backedup your current state):"),
                Container(
                  child: const Text("If you use the sql Adapter you can now use this Widget to display a Graph"),
                  margin: const EdgeInsets.only(left: 15),
                ),


              ],
            ),
            margin: const EdgeInsets.only(top: 3, left: 10),
          ),

          const Text("Other", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("- Connection to IoBroker:"),
                Container(
                  child: const Text("-You now need to setup a username and password to connect to your IoBroker"),
                  margin: const EdgeInsets.only(left: 15),
                ),
                Container(
                  child: const Text("-You must use the same username and password you use to login to the IoBroker"),
                  margin: const EdgeInsets.only(left: 15),
                ),

                Container(
                  child: const Text("-After the first connection you need to approve the device in hiob.x.device.<device>.approved"),
                  margin: const EdgeInsets.only(left: 15),
                ),


              ],
            ),
            margin: const EdgeInsets.only(top: 3, left: 10),
          ),
        ],
      ),
    );
  }
}
