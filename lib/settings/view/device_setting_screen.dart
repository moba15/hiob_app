import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/device_manager.dart';

import '../../../settings/device_setting/device_list/view/device_list_page.dart';

class DeviceSettingsScreen extends StatelessWidget {
  final DeviceManager manager;
  const DeviceSettingsScreen ({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(value: manager, child: const DeviceListPage(),);
  }
}

/*class DeviceSettingScreen extends StatefulWidget {
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
          showDialog(
            barrierDismissible: false,
              context: context,
              builder: (context) {

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
  DeviceType _deviceType = DeviceType.ioBroker;

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final iconController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    idController.dispose();
    iconController.dispose();
    super.dispose();
  }

  @override
  AlertDialog build(BuildContext context) {







    return  AlertDialog(
      actions: [
        TextButton(
          onPressed: () { _save(); },
          child: const Text("Save"),

        ),
        TextButton(
          onPressed: () { Navigator.of(context).pop();  },
          child: const Text("Cancle"),

        )

      ],

      title: const Text("Add Device"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

                child: const SizedBox(
                  width: 50,
                  child: Text("Name:"),
                ),
                margin: const EdgeInsets.only(right: 20.0),
              ),
              Expanded(

                child: TextField(
                  onChanged: (value) {

                  },
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name of device"),
                ),
              )
            ],
          ),

          Row(
            children: [
              Container(
                child: const SizedBox(
                  width: 50,
                  child: Text("Type:"),
                ),
                margin: const EdgeInsets.only(right: 20.0),
              ),
              Expanded(

                child: DropdownButton<DeviceType>(
                  value: _deviceType,
                  items: DeviceType.values
                      .map<DropdownMenuItem<DeviceType>>((DeviceType value) {
                    return DropdownMenuItem<DeviceType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (DeviceType? value) {
                    setState(() {
                      _deviceType = value!;
                    });
                  },

                )
              )
            ],
          ),
          _deviceType.setupWidget(idController),
          Row(
            children: [
              Container(
                child: const SizedBox(
                  width: 50,
                  child: Text("Icon:"),
                ),
                margin: const EdgeInsets.only(right: 20.0),
              ),
              Expanded(

                child: TextField(
                  onChanged: (value) {

                  },
                  controller: iconController,
                  decoration: const InputDecoration(hintText: "Icon ID"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              )
            ],
          ),





        ],
      ),

    );
  }

  void _save() {
    if(int.tryParse(iconController.text) == null || nameController.text.isEmpty || idController.text.isEmpty || int.parse(iconController.text) <0) {
      return;
    }
    if(_deviceType == DeviceType.ioBroker) {
      IoBrokerDevice ioBrokerDevice = IoBrokerDevice(
          iconID: int.parse(iconController.text),
          name: nameController.text,
          objectID: idController.text);
      if (kDebugMode) {
        print(jsonEncode(ioBrokerDevice));
      }
    }


  }
}*/

