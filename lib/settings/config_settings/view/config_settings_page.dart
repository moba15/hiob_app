import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/preconfigs/preconfig.dart';

class ConfigSettingsPage extends StatelessWidget {
  const ConfigSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configs"),
      ),

      body: const _ConfigsListView(),


    );
  }
}


class _ConfigsListView extends StatefulWidget {
  const _ConfigsListView({Key? key}) : super(key: key);

  @override
  State<_ConfigsListView> createState() => _ConfigsListViewState();
}

class _ConfigsListViewState extends State<_ConfigsListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return ListView(
          children: [],
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
      child: Text(preConfig.name, style: const TextStyle(fontSize: 22),),
    );
  }
}


