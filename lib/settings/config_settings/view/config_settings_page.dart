import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/services/impl/iobroker/settings_sync_manager.dart';
import 'package:smart_home/settings/config_settings/bloc/config_bloc.dart';

class ConfigSettingsPage extends StatelessWidget {
  const ConfigSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfigBloc>(
      create: (context) => ConfigBloc(
        settingsSyncManager: context.read<IoBrokerSettingsSyncService>(),
      )..add(ConfigReloadEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Configs"),
              actions: [
                IconButton(
                  onPressed: () =>
                      context.read<ConfigBloc>().add(ConfigReloadEvent()),
                  icon: const Icon(Icons.update, size: 30),
                  tooltip: "Reload",
                ),
              ],
            ),
            body: const _ConfigsListView(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _onPressed(context),
            ),
          );
        },
      ),
    );
  }

  void _onAdd(BuildContext context, String name) async {
    Navigator.pop(context);

    if (name.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          content: Text(
            "Name can't be empty",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );

      return;
    }
    context
        .read<IoBrokerSettingsSyncService>()
        .createNewSettingsTemplate(name)
        .then((value) {
          if (value.success) {
            context.read<ConfigBloc>().add(ConfigAddedEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 700),
                behavior: SnackBarBehavior.floating,
                content: Text(
                  "Successfully added",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1000),
                behavior: SnackBarBehavior.floating,
                content: Text(
                  "Error adding",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        });
    context
        .read<IoBrokerSettingsSyncService>()
        .configAddedStreamController
        .stream
        .first
        .then((value) {
          //TODO: Fetch New list
        });
  }

  _onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _AddSettingTemplateDialog(
          onAdd: (name, context) => _onAdd(context, name),
        );
      },
    );
  }
}

class _AddSettingTemplateDialog extends StatelessWidget {
  final void Function(String name, BuildContext context) onAdd;
  final TextEditingController textEditingController = TextEditingController();

  _AddSettingTemplateDialog({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Config"),
      content: TextFormField(
        controller: textEditingController,
        decoration: const InputDecoration(labelText: "Name"),
      ),
      actions: [
        TextButton(
          onPressed: () => {Navigator.pop(context)},
          child: const Text("Cancle"),
        ),
        TextButton(
          onPressed: () => onAdd(textEditingController.text, context),
          child: const Text("Add"),
        ),
      ],
    );
  }
}

class _ConfigsListView extends StatefulWidget {
  const _ConfigsListView();

  @override
  State<_ConfigsListView> createState() => _ConfigsListViewState();
}

class _ConfigsListViewState extends State<_ConfigsListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (context, state) {
        if (state.configs.isEmpty) {
          return const Center(
            child: Text("It looks like you don't have any settings to sync"),
          );
        }
        return ListView.builder(
          itemCount: state.configs.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              height: 100,
              child: _ConfigCard(
                preConfig: state.configs[index],
                selected: false,
              ),
            );
          },
        );
      },
    );
  }
}

class _ConfigCard extends StatelessWidget {
  final String preConfig;
  final bool selected;

  const _ConfigCard({required this.preConfig, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Colors.green : null,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Text(preConfig, style: const TextStyle(fontSize: 22)),
            const Spacer(),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (c) => _ConfigLoadingDialog(
                      preConfig: preConfig,
                      upload: true,
                    ),
                  ),
                  child: const Text("Upload Settings"),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (c) => _ConfigLoadingDialog(
                      preConfig: preConfig,
                      upload: false,
                    ),
                  ),
                  child: const Text("Load"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSuccessSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 700),
        behavior: SnackBarBehavior.floating,
        content: Text(text, style: const TextStyle(color: Colors.green)),
      ),
    );
  }
}

class _ConfigLoadingDialog extends StatefulWidget {
  final String preConfig;
  final bool upload;

  const _ConfigLoadingDialog({required this.preConfig, required this.upload});

  @override
  State<_ConfigLoadingDialog> createState() => _ConfigLoadingDialogState();
}

class _ConfigLoadingDialogState extends State<_ConfigLoadingDialog> {
  bool widgets = true;
  bool screens = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Choose what to load: ${widget.preConfig}"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildSelectionCardCard(
                name: "Screens",
                iconData: Icons.add_to_home_screen,
                selected: screens,
                onTap: () => setState(() {
                  screens = !screens;
                }),
              ),
              buildSelectionCardCard(
                name: "Widgets",
                iconData: Icons.widgets,
                selected: widgets,
                onTap: () => setState(() {
                  widgets = !widgets;
                }),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: widget.upload ? upload : load,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.upload ? const Text("Upload") : const Text("Load"),
              widget.upload
                  ? const Icon(Icons.upload)
                  : const Icon(Icons.download),
            ],
          ),
        ),
      ],
    );
  }

  Card buildSelectionCardCard({
    required String name,
    bool selected = true,
    required VoidCallback onTap,
    required IconData iconData,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: selected ? Colors.green : Colors.red, width: 2),
      ),
      shadowColor: Colors.green,
      borderOnForeground: true,
      surfaceTintColor: Colors.green,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData, size: 35),
            Row(
              children: [
                Container(margin: const EdgeInsets.only(left: 5)),
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  selected ? Icons.check : Icons.close,
                  color: selected ? Colors.green : Colors.red,
                ),
                Container(margin: const EdgeInsets.only(right: 5)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void load() {
    Navigator.pop(context);
    context
        .read<IoBrokerSettingsSyncService>()
        .loadedSuccessStreamController
        .stream
        .first
        .then((value) => showSuccessSnackBar(context, "Loaded"));
    context.read<IoBrokerSettingsSyncService>().getTemplateSettings(
      widget.preConfig,
      screen: screens,
      widget: widgets,
    );
  }

  void upload() {
    Navigator.pop(context);
    context
        .read<IoBrokerSettingsSyncService>()
        .uploadSuccessStreamController
        .stream
        .first
        .then((value) => showSuccessSnackBar(context, "Uploaded"));
    context.read<IoBrokerSettingsSyncService>().uploadSettings(
      widget.preConfig,
      screen: screens,
      widget: widgets,
    );
  }

  void showSuccessSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 700),
        behavior: SnackBarBehavior.floating,
        content: Text(text, style: const TextStyle(color: Colors.green)),
      ),
    );
  }
}
