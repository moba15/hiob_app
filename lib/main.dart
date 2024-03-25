import 'dart:io';

import 'package:flutter/material.dart';

import 'package:smart_home/manager/manager.dart';

import 'app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  //TODO Fix this bug and run in zoned
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  /* await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: [
        "device",
        "network",
        "errors",
        "notifications",
        "backgroundrunner"
      ],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "MyLogs",
      logsExportDirectoryName: "MyLogs/Exported",
      debugFileOperations: true,
      isDebuggable: true); */

  //Initialize Logging

  // ignore: unused_local_variable
  String version = "1.31";
  Manager manager = Manager();
  await manager.load();
  //TODO:
  runApp(App(
    manager: manager,
    screenManager: manager.screenManager,
  ));
}
