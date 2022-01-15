import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceSettingScreen extends StatefulWidget {
  const DeviceSettingScreen({Key? key}) : super(key: key);

  @override
  _DeviceSettingScreenState createState() => _DeviceSettingScreenState();
}

class _DeviceSettingScreenState extends State<DeviceSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Settings"),
        leading: const Icon(Icons.device_unknown),
      ),

      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: const Text("Device 1 (shelly)"),
                subtitle: const Text("Last updated: 10s ago", style: TextStyle(
                    color: Colors.green,
                    fontSize: 13
                ),),
              trailing: const Icon(Icons.signal_cellular_4_bar, color: Colors.green,),
              onTap: () => {}
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Device 2 (ioBroker)"),
                subtitle: const Text("Last updated: 10s ago", style: TextStyle(
                    color: Colors.green,
                    fontSize: 13
                ),),
                trailing: const Icon(Icons.signal_cellular_4_bar, color: Colors.green,),
                onTap: () => {}
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Device 3 (shelly)"),
                subtitle: const Text("Last updated: 9m ago", style: TextStyle(
                    color: Colors.red,
                    fontSize: 13
                ),),
                trailing: const Icon(Icons.signal_cellular_off, color: Colors.red,),
                onTap: () => {}
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Device 4 (ioBroker)"),
                subtitle: const Text("Last updated: 10s ago", style: TextStyle(
                  color: Colors.green,
                  fontSize: 13
                ),),
                trailing: const Icon(Icons.signal_cellular_4_bar, color: Colors.green,),
                onTap: () => {}
            )
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(

        onPressed: () {
          showDialog(context: context, builder: (context) {
            return const DeviceAddAlertDialog();
          });
        },
        child: const Icon(Icons.add),
        tooltip: "Neues Gerät Hinzufügen",
      ),



    );
  }
}

class DeviceAddAlertDialog extends StatefulWidget  {
  const DeviceAddAlertDialog({Key? key}) : super(key: key);

  @override
  _DeviceAddAlertDialogState createState() => _DeviceAddAlertDialogState();
}

class _DeviceAddAlertDialogState extends State<DeviceAddAlertDialog> {
  @override
  AlertDialog build(BuildContext context) {
    return  AlertDialog(
      title: const Text("Add Device"),
      content: Row(
        children: [
          const Text("Name"),

          TextField(
            onChanged: (e) => {},

          )
        ],
      ),

    );
  }
}

