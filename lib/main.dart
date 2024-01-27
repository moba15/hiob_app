import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/background/background_runner.dart';

import 'package:smart_home/manager/manager.dart';

import 'app.dart';

const notificationChannelId = 'my_foreground';
const notificationChannelId2 = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;
const notificationId2 = 999;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void registerBackgroundIsolate() {
  const MethodChannel backgroundChannel =
      MethodChannel('com.example.backgroundIsolate');
  backgroundChannel.setMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'handleBackgroundMessage') {
      final dynamic args = methodCall.arguments;
      log("Background");
    }
  });
}



void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  String version = "1.3";
  String buildNumber = "100";
  Manager manager = Manager();
  HttpOverrides.global = MyHttpOverrides();

  await manager.load();



  //TODO:
  runApp(App(
    manager: manager,
    screenManager: manager.screenManager,
  ));
}

