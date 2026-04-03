import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/services/cubit/manager_cubit.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/di/injection.dart';
import 'package:smart_home/services/connection/connection_service_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';

import 'package:smart_home/services/service_container.dart';
import 'package:smart_home/view/main/main_screen.dart';

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
  runApp(const _BootstrapApp());
}

class _BootstrapApp extends StatefulWidget {
  const _BootstrapApp();

  @override
  State<_BootstrapApp> createState() => _BootstrapAppState();
}

class _BootstrapAppState extends State<_BootstrapApp> {
  static const Map<String, String> _labels = {
    'di': 'Dependency registration',
    'shared_preferences': 'Shared preferences',
    'logging_service': 'Logging service',
    'metadata_service': 'Metadata service',
    'file_manager': 'File manager',
    'general_manager': 'General manager',
    'screen_manager': 'Screen manager',
    'iobroker_manager': 'ioBroker manager',
    'connection_manager': 'Connection manager',
    'connection_manager_connect': 'Connection manager connect',
    'notification_manager': 'Notification manager',
    'settings_sync_manager': 'Settings sync manager',
    'theme_manager': 'Theme manager',
  };

  late final ServiceCubit managerCubit;
  ServiceContainer? _container;

  @override
  void initState() {
    super.initState();
    managerCubit = ServiceCubit(
      status: ServiceStatus.loading,
      services: _labels.entries
          .map(
            (entry) => ServiceLoadEntry(
              key: entry.key,
              label: entry.value,
              status: ServiceLoadStatus.pending,
            ),
          )
          .toList(growable: false),
    );
    _initialize();
  }

  @override
  void dispose() {
    managerCubit.close();
    super.dispose();
  }

  Future<void> _initialize() async {
    try {
      managerCubit.updateServiceStatus(
        key: 'di',
        label: _labels['di']!,
        status: ServiceLoadStatus.loading,
      );
      await configureDependencies();
      managerCubit.updateServiceStatus(
        key: 'di',
        label: _labels['di']!,
        status: ServiceLoadStatus.loaded,
      );

      final container = await ServiceContainer.create(
        onProgress: (key, status, error) {
          final mappedStatus = switch (status) {
            ServiceInitStatus.started => ServiceLoadStatus.loading,
            ServiceInitStatus.loaded => ServiceLoadStatus.loaded,
            ServiceInitStatus.failed => ServiceLoadStatus.failed,
          };
          managerCubit.updateServiceStatus(
            key: key,
            label: _labels[key] ?? key,
            status: mappedStatus,
            error: error,
          );
        },
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _container = container;
      });
      managerCubit.onStatusChange(ServiceStatus.finished);
    } catch (e) {
      managerCubit.setStartupError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_container == null) {
      return BlocProvider.value(
        value: managerCubit,
        child: const MaterialApp(home: MainScreen()),
      );
    }

    return BlocProvider.value(
      value: managerCubit,
      child: MultiProvider(
        providers: [
          Provider.value(value: _container!),
          Provider.value(value: _container!.fileManager),
          Provider<DeviceServiceInterface>.value(
            value: _container!.deviceManager,
          ),
          Provider<ConnectionServiceInterface>.value(
            value: _container!.connectionManager,
          ),
          Provider.value(value: _container!.ioBrokerManager),
          Provider.value(value: _container!.generalManager),
          Provider.value(value: _container!.loggingService),
          Provider.value(value: _container!.customWidgetManager),
          Provider.value(value: _container!.screenManager),
          Provider.value(value: _container!.settingsSyncManager),
          Provider.value(value: _container!.themeRepository),
          Provider.value(value: _container!.notificationManager),
          Provider.value(value: _container!.connectionManager),
        ],
        child: App(screenManager: _container!.screenManager),
      ),
    );
  }
}
