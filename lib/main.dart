import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:smart_home/manager/manager.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Logging
  await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE,

      ],

      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: ["device","customise","connection", "screen", "iobrokerManager", "error"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "logs",
      logsExportDirectoryName: "logs/Exported",
      debugFileOperations: false,
      attachTimeStamp: true,
      isDebuggable: false);
  String version = "1.3";
  String buildNumber = "100";
  Manager manager = Manager(versionNumber: version, buildNumber: buildNumber);
  await manager.load();

  BlocOverrides.runZoned(() => runApp(App(
        manager: manager,
        screenManager: manager.screenManager,
      )));
}