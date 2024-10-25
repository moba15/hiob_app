import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';

class ChangeLogScreen extends StatelessWidget {
  final Manager manager;
  const ChangeLogScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            manager.status = ManagerStatus.finished;
            manager.managerStatusStreamController.sink
                .add(ManagerStatus.finished);
          },
          child: const Icon(Icons.visibility),
        ),
        appBar: AppBar(
          title: Text(
              "What's new? ${manager.versionNumber}(${manager.buildNumber})"),
        ),
        body: Markdown(
          data: _changelogComplete(),
        ));
  }

  String _changelog() {
    return """
# Templates \n
- fixed some bugs
- added label for slider
  """;
  }

  String _changelogComplete() {
    return """
# Templates \n
- Fixed reorder and scrolling bug inside the PopUp settings
- Fixed PopUp Menu for Multiselection
- Fixed value mapping for value widget
# Experimental
- Added customthemes for widgets
  """;
  }
}
