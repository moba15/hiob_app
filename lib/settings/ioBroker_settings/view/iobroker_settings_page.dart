import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
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
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home)),
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
    ipController.value = TextEditingValue(text: ioBrokerManager.mainIp);
    portController.value =
        TextEditingValue(text: ioBrokerManager.port.toString());
    return ListView(
      children: [
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
                text = Text("Error",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error));
                break;
              case ConnectionStatus.disconnected:
                text = Text("Disconnected",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error));
                break;
              case ConnectionStatus.connecting:
                text = const Text("Connecting",
                    style: TextStyle(color: Colors.orange));
                break;
              case ConnectionStatus.connected:
                text = const Text("Connected",
                    style: TextStyle(color: Colors.green));
                break;
              case ConnectionStatus.loggingIn:
                text = const Text("Logging in...",
                    style: TextStyle(color: Colors.orange));
                break;
              case ConnectionStatus.loggedIn:
                text = const Text("Logged in",
                    style: TextStyle(color: Colors.green));
                break;
              case ConnectionStatus.loginDeclined:
                text = const Text("Login declined (need approval)",
                    style: TextStyle(color: Colors.redAccent));
                break;
              case ConnectionStatus.tryAgain:
                text = const Text("Trying again...",
                    style: TextStyle(color: Colors.orange));
                break;
              default:
                text = Text(
                  "Unknown: " + state.name,
                  style: const TextStyle(color: Colors.grey),
                );
            }

            return Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: text);
          },
          bloc: ConnectionCubit(
              status: Manager.instance!.connectionManager.connectionStatus),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () =>
                {context.read<Manager>().connectionManager.reconnect()},
            child: const Text("Reconnect"),
          ),
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                CheckboxListTile(
                  value: ioBrokerManager.usePwd,
                  onChanged: (b) {
                    setState(() => {ioBrokerManager.changeUsePWD(b ?? true)});
                  },
                  title: const Text("Use Password Login"),
                ),
                if (ioBrokerManager.usePwd)
                  Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                    child: TextFormField(
                      initialValue: ioBrokerManager.user,
                      decoration: const InputDecoration(labelText: "User"),
                      onChanged: (v) => ioBrokerManager.changeUser(v),
                    ),
                  ),
                if (ioBrokerManager.usePwd)
                  Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 20.0, top:10),
                    child: TextFormField(
                      initialValue: ioBrokerManager.password,
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      onChanged: (v) => ioBrokerManager.changePassword(v),
                    ),
                  ),
              ],
            );
          },
        ),
        _SecondaryAddressSettings(
          ioBrokerManager: ioBrokerManager,
        ),
        StreamBuilder<EnumUpdateState>(
          stream: ioBrokerManager.enumsUpdateStateStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const ListTile(
                leading: Icon(Icons.extension),
                title: Text("Enums"),
                subtitle: Text("Last updated: ERROR"),
              );
            } else if (snapshot.hasData) {
              switch (snapshot.data) {
                case EnumUpdateState.finished:
                  return ListTile(
                    leading: const Icon(Icons.extension),
                    title: const Text("Enums"),
                    subtitle: Text("Last updated: " +
                        (ioBrokerManager.lastEnumUpdate == null
                            ? "None"
                            : DateFormat("dd.MM.yyyy hh:mm a")
                                .format(ioBrokerManager.lastEnumUpdate!))),
                    trailing: TextButton(
                        onPressed: ioBrokerManager.updateEnums,
                        child: const Text("Update")),
                  );
                default:
                  return ListTile(
                    leading: const Icon(Icons.extension),
                    title: const Text("Enums"),
                    subtitle: Text(
                        "Last updated: ${ioBrokerManager.lastEnumUpdate == null ? "None" : DateFormat("dd.MM.yyyy hh:mm a").format(ioBrokerManager.lastEnumUpdate!)}"),
                    trailing: const CircularProgressIndicator(),
                  );
              }
            } else {
              return ListTile(
                leading: const Icon(Icons.extension),
                title: const Text("Enums"),
                subtitle: Text(
                    "Last updated: ${ioBrokerManager.lastEnumUpdate == null ? "None" : DateFormat("dd.MM.yyyy hh:mm a").format(ioBrokerManager.lastEnumUpdate!)}"),
                trailing: ioBrokerManager.isUpdating
                    ? const CircularProgressIndicator()
                    : TextButton(
                        onPressed: ioBrokerManager.updateEnums,
                        child: const Text("Update")),
              );
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.import_export),
          title: const Text("Synchronize Enums"),
          trailing: TextButton(
              onPressed: ioBrokerManager.syncEnumsToDevice,
              child: const Text("Sync")),
        ),
      ],
    );
  }
}

class _SecondaryAddressSettings extends StatefulWidget {
  final IoBrokerManager ioBrokerManager;

  const _SecondaryAddressSettings({Key? key, required this.ioBrokerManager})
      : super(key: key);

  @override
  State<_SecondaryAddressSettings> createState() =>
      _SecondaryAddressSettingsState();
}

class _SecondaryAddressSettingsState extends State<_SecondaryAddressSettings> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Second Address"),
      children: [
        CheckboxListTile(
          title: const Text("Use Secondary IP"),
          value: widget.ioBrokerManager.useSecondaryAddress,
          onChanged: (v) async {
            if (v == true) {
              var status = await Permission.location.status;
              if (status.isDenied) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Missing Permissions"),
                        content: const Text(
                            "To use this feature this app needd access to your location in order to check the current Wifi name"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Back"))
                        ],
                      );
                    });
                return;
              }
            }

            setState(() {
              widget.ioBrokerManager.changeUseSecondaryAddress(v ?? false);
            });
          },
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextFormField(
            initialValue: widget.ioBrokerManager.knownNetwork,
            decoration: const InputDecoration(labelText: "Home network name"),
            enabled: widget.ioBrokerManager.useSecondaryAddress,
            onChanged: (v) => widget.ioBrokerManager.changeKnownNetwork(v),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextFormField(
            initialValue: widget.ioBrokerManager.secondaryAddress,
            decoration: const InputDecoration(labelText: "IP/URL"),
            enabled: widget.ioBrokerManager.useSecondaryAddress,
            onChanged: (v) => widget.ioBrokerManager.changeSecondaryAddress(v),
          ),
        )
      ],
    );
  }
}
