import 'dart:io';

import 'package:file_picker/file_picker.dart' as fp;
import 'package:my_logger/core/constants.dart';
import 'package:my_logger/models/filter.dart';
import 'package:my_logger/models/logger.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'dart:developer';

class CustomLogger {
  final FileManager fileManager;
  late Directory appDocumentsDir;
  late File file;
  CustomLogger({required this.fileManager}) {}

  static void logInfoNotification(
      {required String methodname, required String logMessage}) {
    MyLogger.log(
        text: logMessage,
        type: LogLevel.INFO,
        methodName: methodname,
        className: "Notifications");
  }

  static void logInfoBackgroundRunner(
      {required String methodname, required String logMessage}) {
    MyLogger.log(
        text: logMessage,
        type: LogLevel.INFO,
        methodName: methodname,
        className: "Backgroundrunner");
  }

  static void exportInfoLogs() async {
    File fileExport = await MyLogger.logs.export(
      fileName: "export-all-logs",
      exportType: FileType.TXT,
      filter: LogFilter.last24Hours(),
    );

    String? result = await fp.FilePicker.platform.getDirectoryPath(
        dialogTitle: 'Please select an output file:',
        initialDirectory: "Download");

    File file = await fileExport.copy("$result/export-all-logs.txt");
    file.createSync();
  }
}
