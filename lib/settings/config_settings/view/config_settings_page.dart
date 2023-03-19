import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/preconfigs/preconfig.dart';
import 'package:smart_home/settings/config_settings/bloc/config_bloc.dart';

class ConfigSettingsPage extends StatelessWidget {
  final ConfigBloc _configBloc = ConfigBloc();
  ConfigSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configs"),
        actions: [
          IconButton(onPressed: () => _configBloc.add(ConfigReloadEvent()), icon: Icon(Icons.update, size: 30,), tooltip: "Reload",)
        ],
      ),

      body: BlocProvider<ConfigBloc>(

        create: (BuildContext context) {
          return _configBloc;
        },
        child:  _ConfigsListView(configBloc: _configBloc,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _onPressed(context)
      ),


    );
  }

  void _onAdd(context, String name) async {

    Navigator.pop(context);
    
    if(name.trim().isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        content: Text("Name can't be empty", style: TextStyle(color: Colors.red),),
      ));

      return;
    }
    Manager.instance!.settingsSyncManager.createNewSettingsTemplate(name);
    Manager.instance!.settingsSyncManager.configAddedStreamController.stream.first.then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(milliseconds: 700),
        behavior: SnackBarBehavior.floating,
        content: Text("Added", style: TextStyle(color: Colors.green),),
      ));

      //TODO: Fetch New list
      _configBloc.add(ConfigAddedEvent());
    });

  }

  _onPressed(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return _AddSettingTemplateDialog(onAdd: (name, context) => _onAdd(context, name));
    },);
  }
}

class _AddSettingTemplateDialog extends StatelessWidget {
  final Function(String, BuildContext) onAdd;
  final TextEditingController textEditingController = TextEditingController();
  _AddSettingTemplateDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Config"),
      content: TextFormField(
        controller: textEditingController,

        decoration: const InputDecoration(labelText: "Name"),
      ),

      actions: [
        TextButton(
          onPressed: () => {Navigator.pop(context)},
          child: Text("Cancle"),
        ),

        TextButton(
          onPressed: ()  => onAdd(textEditingController.text, context),
          child: Text("Add"),
        ),
      ],
    );
  }
}



class _ConfigsListView extends StatefulWidget {
  final ConfigBloc configBloc;
  const _ConfigsListView({Key? key, required this.configBloc}) : super(key: key);

  @override
  State<_ConfigsListView> createState() => _ConfigsListViewState();
}

class _ConfigsListViewState extends State<_ConfigsListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigBloc, ConfigState>(
      bloc: widget.configBloc..add(ConfigReloadEvent()),
      builder: (context, state) {
        if(state.configs.isEmpty) {
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
              child: _ConfigCard(preConfig: state.configs[index], selected: false),
            );
          },
        );
        
      },
    );
  }
}

class _ConfigCard extends StatelessWidget {
  final PreConfig preConfig;
  final bool selected;
  const _ConfigCard({Key? key, required this.preConfig, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

        color: selected ? Colors.green : null,
        child: Align(
          alignment: Alignment.center,
          child:  Column(

            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Text(preConfig.name, style: const TextStyle(fontSize: 22),),
              const Spacer(),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Manager.instance!.settingsSyncManager.uploadSuccessStreamController.stream.first.then((value) => showSuccessSnackBar(context, "Uploaded"));
                      Manager.instance!.settingsSyncManager.uploadSettings(preConfig);

                      },
                    child: const Text("Upload Settings"),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {Manager.instance!.settingsSyncManager.loadedSuccessStreamController.stream.first.then((value) => showSuccessSnackBar(context, "Loaded")); Manager.instance!.settingsSyncManager.getTemplateSettings(preConfig);   },
                    child: const Text("Load"),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {  },
                    child: selected ? const Text("Auto sync on"): const Text("Auto sync off"),
                  ),

                ],
              ),


            ],
          ),
        )
    );
  }
  void showSuccessSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 700),
      behavior: SnackBarBehavior.floating,
      content: Text(text, style: TextStyle(color: Colors.green),),
    ));
  }
}






