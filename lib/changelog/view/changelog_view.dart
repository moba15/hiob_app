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
          manager.managerStatusStreamController.sink.add(
            ManagerStatus.finished,
          );
        },
        child: const Icon(Icons.visibility),
      ),
      appBar: AppBar(
        title: Text(
          "What's new? ${manager.versionNumber}(${manager.buildNumber})",
        ),
      ),
      body: Markdown(data: _changelog()),
    );
  }

  String _changelog() {
    return """
- Update android compileSdk, minSdk, targetSdk to fulfill googles new guidelines
- Update flutter version
- other smaller bug fixes
- **Note**: New major version incoming (start of Q4/25 at the latest)
  """;
  }

  String _changelogComplete() {
    return """
- Possible fix for crashed 
- Added more logging
  """;
  }
}
