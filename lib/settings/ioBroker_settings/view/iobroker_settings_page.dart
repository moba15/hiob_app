import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/connection/cubit/connection_cubit.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';

import '../../../manager/manager.dart';

class IoBrokerSettingsPage extends StatelessWidget {
  const IoBrokerSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IoBroker Settings"),
        actions: [
          IconButton(onPressed: ()  {

            Navigator.popUntil(context, (route) => route.isFirst);

          }, icon: const Icon(Icons.home)),
        ],
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
        BlocBuilder<ConnectionCubit, ConnectionStatus>(
          builder: (context, state) {
            Text text;
            switch (state) {

              case ConnectionStatus.error:
                 text = Text("Error", style: TextStyle(color: Theme.of(context).errorColor));
                 break;
              case ConnectionStatus.disconnected:
                text = Text("Disconnected", style: TextStyle(color: Theme.of(context).errorColor));
                break;
              case ConnectionStatus.connecting:
                text = const Text("Connecting", style: TextStyle(color: Colors.orange));
                break;
              case ConnectionStatus.connected:
                text = const Text("Connected", style: TextStyle(color: Colors.green));
                break;
              case ConnectionStatus.loggingIn:
                text = const Text("Logging in...", style: TextStyle(color: Colors.orange));
                break;
              case ConnectionStatus.loggedIn:
                text = const Text("Logged in", style: TextStyle(color: Colors.green));
                break;
              case ConnectionStatus.loginDeclined:
                text = const Text("Login declined (need approval)", style: TextStyle(color: Colors.redAccent));
                break;
              case ConnectionStatus.tryAgain:
                text = const Text("Trying again...", style: TextStyle(color: Colors.orange));
                break;
              default:
                text = Text("Unknown: " + state.name, style: const TextStyle(color: Colors.grey),);



            }

            return Container(margin: const EdgeInsets.only(left: 20.0, right: 20.0), child: text);
          },
          bloc: ConnectionCubit(status: Manager.instance!.connectionManager.connectionStatus),

        ),

        /*StreamBuilder<bool>(
          stream: ioBrokerManager.connectionStatusStreamController.stream,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return  Container(margin: const EdgeInsets.only(left: 20.0, right: 20.0), child: const Text("Error", style: TextStyle(color: Colors.red),));
            }
            if(snapshot.hasData && snapshot.data != null) {
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
        ), */

        Center(
          child: ElevatedButton(
            onPressed: () => {context.read<Manager>().connectionManager.reconnect()},
            child: const Text("Reconnect"),
          ),
        ),
        TextFormField(
          initialValue: ioBrokerManager.user,
          decoration: const InputDecoration(labelText: "User"),
          onChanged: (v) => ioBrokerManager.changeUser(v),
        ),

        TextFormField(
          initialValue: ioBrokerManager.password,
          decoration: const InputDecoration(labelText: "Password"),
          onChanged: (v) => ioBrokerManager.changePassword(v),
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
          title: const Text("Synchronize Enums"),
          trailing: TextButton(onPressed: ioBrokerManager.syncEnumsToDevice, child: const Text("Sync")),
        ),



      ],
    );
  }
}








class _ExternalIPConfig extends StatefulWidget {
  const _ExternalIPConfig({Key? key}) : super(key: key);

  @override
  State<_ExternalIPConfig> createState() => _ExternalIPConfigState();
}

class _ExternalIPConfigState extends State<_ExternalIPConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children:  [
          Row(
            children: const [

              Expanded(
                child: TextField(
                  decoration: InputDecoration(label: Text("IP/URL")),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

