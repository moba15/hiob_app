import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/devices/device.dart';
import 'package:smart_home/devices/http_devices/iobroker_device.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/screens/settings/device/cubit/device_list_cubit.dart';

import '../../../../devices/cubit/device_cubit.dart';

class DeviceListPage extends StatelessWidget {
  const DeviceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceListCubit deviceListCubit = DeviceListCubit(deviceManager: context.read<DeviceManager>());
    return Scaffold(
      appBar: AppBar(title: const Text("Device Settings"),),
      body: BlocProvider(
        create: (_) => deviceListCubit..fetchList(),
        child: DeviceListView(),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {

                return DeviceListView();
              });
        },
        child: const Icon(Icons.add),
        tooltip: "Neues Gerät Hinzufügen",
      ),


    );
  }
}

class DeviceListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final state = context.watch<DeviceListCubit>().state; //Listen to state
    switch(state.status) {
      case ListStatus.failure:
        return const Center(child: Text("Something went wrong!!"),);
      case ListStatus.success:
        return DeviceView(devices: state.devices);
      case ListStatus.loading:
        return const Center(child: CircularProgressIndicator(),);

    }
  }
}

class DeviceView extends StatelessWidget {
  final List<Device> devices;
  const DeviceView({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return devices.isEmpty ?
        const Center(child: Text("No Device yet"),)
        :
    ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, int index) {
        return BlocProvider(
          create: (_) => devices[index],
          child: DeviceTile(device: devices[index], onDelete: (s) => {},),

        );

      },

      );
  }
}

class DeviceTile extends StatelessWidget {
  final Device device;
  final ValueSetter<String> onDelete;
  const DeviceTile({Key? key, required this.device, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Device>().state;
    return Material(
      child: ListTile(
        leading: const Icon(Icons.power_settings_new),
        title:  (device is IoBrokerDevice) ? Text("${device.name} (IoBroker)") : Text("${device.name} "),
        trailing: state.status == DeviceStatus.READY ? const Icon(Icons.signal_cellular_4_bar, color: Colors.green,)
                                                      : const Icon(Icons.signal_cellular_off, color: Colors.red,),
        subtitle: Text("Last updated: ${durationToString(device.state.lastUpdated)} ago", style: TextStyle(
            color: state.status == DeviceStatus.READY ? Colors.green
                : Colors.red,
            fontSize: 13
        ),),

      ),

    );
  }

  String durationToString(Duration duration) {
    int d = duration.inDays;
    int m = duration.inMinutes;
    int s = duration.inSeconds;
    if(d!= 0) {
      return d==1 ? "$d day" : "$d days";
    } else if(m!= 0) {
      return "$m min.";
    } else {
      return  "$s sec.";
    }

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
          onPressed: () {
            if(int.tryParse(iconController.text) == null || nameController.text.isEmpty || idController.text.isEmpty || int.parse(iconController.text) <0) {
              return;
            }
            if(_deviceType == DeviceType.ioBroker) {
              IoBrokerDevice ioBrokerDevice = IoBrokerDevice(
                  iconID: int.parse(iconController.text),
                  name: nameController.text,
                  objectID: idController.text, value: null, id: 'iasdasd', status: DeviceStatus.UNAVALIBLE);
              context.watch<DeviceListCubit>().addDevice(ioBrokerDevice);
              if (kDebugMode) {
                print(jsonEncode(ioBrokerDevice));
              }
            }


          },
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


}


