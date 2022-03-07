

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';
import 'package:smart_home/device/device.dart';
import '../iobroker_device.dart';


class DeviceTileApp extends StatelessWidget {
  final Device device;
  const DeviceTileApp({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeviceBloc(device, t: device.lastUpdated),
      child: const DeviceTile()

    );
  }
}

class DeviceTile extends StatelessWidget {

  const DeviceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final lastUpdated = context.select((DeviceBloc bloc) => bloc.state.lastUpdated);

    final status = context.select((DeviceBloc bloc) => bloc.state.status);
    final device = context.select((DeviceBloc bloc) => bloc.device);

    return ListTile(
      leading: const Icon(Icons.power_settings_new),
      title:  (device is IoBrokerDevice) ? Text("${device.name} (IoBroker)") : Text("${device.name} "),
      trailing: status == DeviceStatus.ready ? const Icon(Icons.signal_cellular_4_bar, color: Colors.green,)
          : const Icon(Icons.signal_cellular_off, color: Colors.red,),
      subtitle: Text("Last updated: ${durationToString(DateTime.now().difference(lastUpdated))} ", style: TextStyle(
          color: status == DeviceStatus.ready ? Colors.green
              : Colors.red,
          fontSize: 13
      ),),

    );
  }

  String durationToString(Duration duration) {
    int d = duration.inDays;
    int m = duration.inMinutes;
    int s = duration.inSeconds;
    if(d!= 0) {
      return d==1 ? "$d day" : "$d days";
    } else if(m!= 0) {
      return "$m min.";
    } else {
      return  "$s sec.";
    }

  }
}

