import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';

import '../../../manager/manager.dart';

class IoBrokerSettingsPage extends StatelessWidget {
  const IoBrokerSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IoBroker Settings"),
      ),
      body: IoBrokerSettingsView(),
    );
  }
}

class IoBrokerSettingsView extends StatelessWidget {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  IoBrokerSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IoBrokerManager ioBrokerManager = context.read<Manager>().ioBrokerManager;
    ipController.value = TextEditingValue(text: ioBrokerManager.ip);
    portController.value = TextEditingValue(text: ioBrokerManager.port.toString());
    return ListView(
      children:  [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  onChanged: (v) => {ioBrokerManager.changeIp(v)},
                  decoration: const InputDecoration(labelText: "IP"),
                  controller: ipController,

                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  decoration: const InputDecoration(labelText: "Port"),
                  onChanged: (v) => {ioBrokerManager.changePort(int.parse(v))},
                  controller: portController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
              ),
            )
          ],
        ),
        StreamBuilder<bool>(
          stream: ioBrokerManager.connectionStatusStreamController.stream,
          builder: (context, snapshot) {
            print("Build");
            if(snapshot.hasError) {
              return  Container(margin: const EdgeInsets.only(left: 20.0, right: 20.0), child: Text("Error", style: TextStyle(color: Colors.red),));
            }
            if(snapshot.hasData && snapshot.data != null) {
              print("Data: " + snapshot.data.toString());
              return Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(snapshot.data! ? "Connected" : "Not Connected", style: TextStyle(color: snapshot.data! ? Colors.green : Colors.red),),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(ioBrokerManager.connected ? "Connected" : "Not Connected", style: TextStyle(color: ioBrokerManager.connected ? Colors.green : Colors.red),),
              );
            }
          },
        ),

        Center(
          child: ElevatedButton(
            onPressed: () => {context.read<Manager>().connectionManager.reconnect()},
            child: const Text("Reconnect"),
          ),
        ),
        StreamBuilder<EnumUpdateState>(
          stream: ioBrokerManager.enumsUpdateStateStreamController.stream,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return const ListTile(
                leading: Icon(Icons.extension),
                title: Text("Enums"),
                subtitle: Text("Last updated: ERROR"),
              );
            } else if(snapshot.hasData) {
              switch (snapshot.data) {
                case EnumUpdateState.finished:
                  return ListTile(
                    leading: const Icon(Icons.extension),
                    title: const Text("Enums"),
                    subtitle: Text("Last updated: " + (ioBrokerManager.lastEnumUpdate == null ? "None": DateFormat("dd.MM.yyyy hh:mm a").format(ioBrokerManager.lastEnumUpdate!))),
                    trailing: TextButton(onPressed: ioBrokerManager.updateEnums, child: const Text("Update")),
                  );
                default:
                  return ListTile(
                    leading: const Icon(Icons.extension),
                    title: const Text("Enums"),
                    subtitle: Text("Last updated: " + (ioBrokerManager.lastEnumUpdate == null ? "None": DateFormat("dd.MM.yyyy hh:mm a").format(ioBrokerManager.lastEnumUpdate!))),
                    trailing: const CircularProgressIndicator(),
                  );
              }
            } else {
              return ListTile(
                leading: const Icon(Icons.extension),
                title: const Text("Enums"),
                subtitle: Text("Last updated: " + (ioBrokerManager.lastEnumUpdate == null ? "None": DateFormat("dd.MM.yyyy hh:mm a").format(ioBrokerManager.lastEnumUpdate!))),
                trailing: ioBrokerManager.isUpdating ? const CircularProgressIndicator() : TextButton(onPressed: ioBrokerManager.updateEnums, child: const Text("Update")),
              );
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.import_export),
          title: const Text("Import Enums"),
          trailing: TextButton(onPressed: ioBrokerManager.exportEnumsToDevice, child: const Text("Import")),
        )


      ],
    );
  }
}

