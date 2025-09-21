import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/connection/cubit/connection_cubit.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';

import '../../../manager/manager.dart';

bool _isObscure = true;

class IoBrokerSettingsPage extends StatelessWidget {
  const IoBrokerSettingsPage({super.key});

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
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: IoBrokerSettingsView(),
    );
  }
}

class IoBrokerSettingsView extends StatelessWidget {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();

  IoBrokerSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    IoBrokerManager ioBrokerManager = Manager().ioBrokerManager;
    ipController.value = TextEditingValue(text: ioBrokerManager.mainIp);
    portController.value = TextEditingValue(
      text: ioBrokerManager.port.toString(),
    );
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 15),
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
                margin: const EdgeInsets.only(right: 20.0, top: 15),
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
            ),
          ],
        ),
        BlocBuilder<ConnectionCubit, ConnectionStatus>(
          builder: (context, state) {
            Text text;
            switch (state) {
              case ConnectionStatus.error:
                text = Text(
                  "Error",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                );
                break;
              case ConnectionStatus.disconnected:
                text = Text(
                  "Disconnected",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                );
                break;
              case ConnectionStatus.connecting:
                text = const Text(
                  "Connecting",
                  style: TextStyle(color: Colors.orange),
                );
                break;
              case ConnectionStatus.connected:
                text = const Text(
                  "Connected",
                  style: TextStyle(color: Colors.green),
                );
                break;
              case ConnectionStatus.loggingIn:
                text = const Text(
                  "Logging in...",
                  style: TextStyle(color: Colors.orange),
                );
                break;
              case ConnectionStatus.loggedIn:
                text = const Text(
                  "Logged in",
                  style: TextStyle(color: Colors.green),
                );
                break;
              case ConnectionStatus.loginDeclined:
                text = const Text(
                  "Login declined (need approval)",
                  style: TextStyle(color: Colors.redAccent),
                );
                break;
              case ConnectionStatus.newAesKey:
                text = const Text(
                  "New AES key available",
                  style: TextStyle(color: Colors.redAccent),
                );
                break;
              case ConnectionStatus.emptyAES:
                text = const Text(
                  "Missing or wrong AES Key",
                  style: TextStyle(color: Colors.redAccent),
                );
                break;
              case ConnectionStatus.tryAgain:
                text = const Text(
                  "Trying again...",
                  style: TextStyle(color: Colors.orange),
                );
                break;
              case ConnectionStatus.wrongAdapterVersion:
                text = const Text(
                  "Please update your adapter (find newest version on npm)",
                  style: TextStyle(color: Colors.yellow),
                );
                break;
              default:
                text = Text(
                  "Unknown: ${state.name}",
                  style: const TextStyle(color: Colors.grey),
                );
            }

            return Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: text,
            );
          },
          bloc: ConnectionCubit(
            status: Manager.instance.connectionManager.connectionStatus,
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => {
              context.read<Manager>().connectionManager.reconnect(
                delayed: false,
              ),
            },
            child: const Text("Reconnect"),
          ),
        ),
        StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: [
                CheckboxListTile(
                  value: ioBrokerManager.useSecureConnection,
                  onChanged: (b) {
                    setState(
                      () => ioBrokerManager.changeUseSecureCon(b ?? true),
                    );
                  },
                  title: const Text("Use wss Connection"),
                ),
                CheckboxListTile(
                  value: ioBrokerManager.usePwd,
                  onChanged: (b) {
                    setState(() {
                      ioBrokerManager.changeUsePWD(b ?? true);
                    });
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
                    margin: const EdgeInsets.only(
                      left: 30.0,
                      right: 20.0,
                      top: 10,
                    ),
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
      ],
    );
  }
}

class _SecondaryAddressSettings extends StatefulWidget {
  final IoBrokerManager ioBrokerManager;

  const _SecondaryAddressSettings({required this.ioBrokerManager});

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
                        "To use this feature this app needd access to your location in order to check the current Wifi name",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Back"),
                        ),
                      ],
                    );
                  },
                );
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
        ),
      ],
    );
  }
}

class _IobrokerObjectFilter extends StatefulWidget {
  const _IobrokerObjectFilter({super.key});

  @override
  State<_IobrokerObjectFilter> createState() => __IobrokerObjectFilterState();
}

class __IobrokerObjectFilterState extends State<_IobrokerObjectFilter> {
  List<String> allAdapaters = [];
  List<String> selectedFilters = [];
  @override
  void initState() {
    super.initState();
    Manager().deviceManager.getIobrokerAdapaters().then((value) {
      setState(() {
        allAdapaters = value;
        selectedFilters.clear();
        selectedFilters.addAll(Manager().deviceManager.preDefinedFilters);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Object filter"),
      children: [
        Wrap(
          spacing: 5,
          runSpacing: 10,
          children: [
            for (String s in selectedFilters)
              FilterChip(
                label: Text(s),

                onSelected: (value) {
                  setState(() {
                    if (value) {
                      selectedFilters.add(s);
                    } else {
                      selectedFilters.remove(s);
                    }
                  });
                  Manager().deviceManager.updateFilters(selectedFilters);
                },
                selected: true,
              ),
            for (String s in allAdapaters)
              if (!selectedFilters.contains(s))
                FilterChip(
                  label: Text(s),

                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        selectedFilters.add(s);
                      } else {
                        selectedFilters.remove(s);
                      }
                    });
                    Manager().deviceManager.updateFilters(selectedFilters);
                  },
                  selected: false,
                ),
          ],
        ),
      ],
    );
  }
}
