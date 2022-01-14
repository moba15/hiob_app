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
              trailing: const Icon(Icons.signal_cellular_4_bar, color: Colors.green,),
              onTap: () => {}
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Device 2 (ioBroker)"),
                trailing: const Icon(Icons.signal_cellular_4_bar, color: Colors.green,),
                onTap: () => {}
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Device 3 (shelly)"),
                trailing: const Icon(Icons.signal_cellular_off, color: Colors.red,),
                onTap: () => {}
            ),
            ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("Device 4 (ioBroker)"),
                trailing: const Icon(Icons.signal_cellular_4_bar, color: Colors.green,),
                onTap: () => {}
            )
          ],
        ),
      ),

    );
  }
}
