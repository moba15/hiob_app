import 'dart:io';

import 'package:file_picker/file_picker.dart' as fp;
import 'package:smart_home/manager/file_manager.dart';

class CustomLogger {
  final FileManager fileManager;
  late Directory appDocumentsDir;
  late File file;
  CustomLogger({required this.fileManager});

  static void logInfoNotification({
    required String methodname,
    required String logMessage,
  }) {}

  static void logInfoBackgroundRunner({
    required String methodname,
    required String logMessage,
  }) {}

  static void exportInfoLogs() async {}

  static void deletAll() {}
}
