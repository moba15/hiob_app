import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/device_manager.dart';

import '../../../settings/device_setting/device_list/view/device_list_page.dart';

class DeviceSettingsScreen extends StatelessWidget {
  final DeviceManager manager;

  const DeviceSettingsScreen({Key? key, required this.manager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: manager,
      child: const DeviceListPage(),
    );
  }
}
