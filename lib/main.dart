import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';
import 'package:smart_home/settings/view/main_screen.dart';

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
      logTypesEnabled: ["device","customise","connection", "screen"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "logs",
      logsExportDirectoryName: "logs/Exported",
      debugFileOperations: false,
      attachTimeStamp: true,
      isDebuggable: false);

  Manager manager = Manager();
  await manager.load();
  BlocOverrides.runZoned(() => runApp(App(
        manager: manager,
        screenManager: manager.screenManager,
      )));
}

class MyApp extends StatelessWidget {
  final Manager manager;

  const MyApp({Key? key, required this.manager}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenListCubit>(
        create: (c) => ScreenListCubit(screenManager: manager.screenManager),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainScreen(
            manager: manager,
          ),
        ));
  }
}
