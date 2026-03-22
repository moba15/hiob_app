import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';

class ChangeLogScreen extends StatelessWidget {
  const ChangeLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO
          //manager.status = ManagerStatus.finished;
        },
        child: const Icon(Icons.visibility),
      ),
      appBar: AppBar(
        title: Text(
          "What's new? ", //TODO ${manager.versionNumber}(${manager.buildNumber})",
        ),
      ),
      body: Markdown(data: _changelog()),
    );
  }

  String _changelog() {
    return """
- Added first gRPC support
- Added support for client side states database
- And many more optimizations
- IMPORTANT This is only an alpha version, it should only be used for testing and feedback. Many features are not implemented yet

  """;
  }

  String _changelogComplete() {
    return """
- Possible fix for crashed 
- Added more logging
  """;
  }
}
