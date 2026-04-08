import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:smart_home/services/cubit/manager_cubit.dart';

class ChangeLogScreen extends StatelessWidget {
  const ChangeLogScreen({super.key});

  static const String _changelogAssetPath = 'assets/changelog/Changelog.md';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _close(context),
        tooltip: 'Continue',
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: Text(
          "What's new? ", //TODO ${manager.versionNumber}(${manager.buildNumber})",
        ),
      ),
      body: FutureBuilder<String>(
        future: _loadChangelog(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data!);
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load changelog.'));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<String> _loadChangelog(BuildContext context) {
    return DefaultAssetBundle.of(context).loadString(_changelogAssetPath);
  }

  void _close(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return;
    }
    context.read<ServiceCubit>().onStatusChange(ServiceStatus.finished);
  }
}
