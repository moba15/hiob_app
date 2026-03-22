import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/di/injection.dart';

import 'package:smart_home/services/service_container.dart';

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
  await configureDependencies();
  final container = await ServiceContainer.create();

  //TODO:
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: container),
        Provider.value(value: container.fileManager),
        Provider.value(value: container.deviceManager),
        Provider.value(value: container.connectionManager),
        Provider.value(value: container.ioBrokerManager),
        Provider.value(value: container.generalManager),
        Provider.value(value: container.loggingService),

        Provider.value(value: container.customWidgetManager),
        Provider.value(value: container.screenManager),
        Provider.value(value: container.settingsSyncManager),
        Provider.value(value: container.themeManager),
      ],
      child: App(screenManager: container.screenManager),
    ),
  );
}
