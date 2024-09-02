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
          data: _changelog(),
        ));
  }

  String _changelog() {
    return """
# Templates \n
- **Important:** The new features are all highly experimental
- I completly rewrote the way templates/widgtes work
- You now can find two (new) widgets one of them a new input widget
- With the new types of widgtes you can directly add a popupmenu, so you don't have to use a advanced widget for this
- The idea is that the advanced widget is no longer needed, with these kind of widgets
- In the future I will replace all old widgtes with the new widget types and give you a way to migrate your old widgtes to the new one
- Please provide feadback over github or the iobroker forum
  """;
  }
}
