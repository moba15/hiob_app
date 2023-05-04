import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/icon_picker.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/ioBroker/enum/enum.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';

import '../../../../device/device.dart';
import '../../../../device/iobroker_device.dart';
import '../../../../device/view/device_tile.dart';
import '../../../../utils/list_status.dart';
import '../cubit/device_list_cubit.dart';

class DeviceListPage extends StatelessWidget {
  const DeviceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Settings"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: BlocProvider(
        create: (_) =>
            DeviceListCubit(deviceManager: context.read<DeviceManager>())
              ..fetchList(),
        child: const DeviceListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => DeviceAddPage(
                        deviceManager: context.read<DeviceManager>(),
                      )));
        },
        child: const Icon(Icons.add),
        tooltip: "Neues Gerät Hinzufügen",
      ),
    );
  }
}

class DeviceListView extends StatelessWidget {
  const DeviceListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DeviceListCubit>().state;

    switch (state.status) {
      case ListStatus.failure:
        return const Center(
          child: Text("Something went wrong!!"),
        );
      case ListStatus.success:
        return DeviceView(devices: state.devices);
      case ListStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}

class DeviceView extends StatelessWidget {
  final List<Device> devices;

  const DeviceView({Key? key, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return devices.isEmpty
        ? const Center(
            child: Text("No Device yet"),
          )
        : ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, int index) {
              return Dismissible(
                background: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerRight,
                ),
                direction: DismissDirection.endToStart,
                key: ValueKey<Device>(devices[index]),
                child: DeviceTileApp(device: devices[index]),
                dragStartBehavior: DragStartBehavior.down,
                onDismissed: (direction) => {
                  context
                      .read<DeviceListCubit>()
                      .deviceManager
                      .removeDevice(devices[index])
                },
              );
            },
          );
  }
}

/*class DeviceTile extends StatelessWidget {
  final Device device;
  final ValueSetter<String> onDelete;
  const DeviceTile({Key? key, required this.device, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<Device>().state;
    return Material(
      child: ListTile(
        leading: const Icon(Icons.power_settings_new),
        title:  (device is IoBrokerDevice) ? Text("${device.name} (IoBroker)") : Text("${device.name} "),
        trailing: state.status == DeviceStatus.READY ? const Icon(Icons.signal_cellular_4_bar, color: Colors.green,)
                                                      : const Icon(Icons.signal_cellular_off, color: Colors.red,),
        subtitle: Text("Last updated: ${durationToString(device.state.lastUpdated)} ago", style: TextStyle(
            color: state.status == DeviceStatus.READY ? Colors.green
                : Colors.red,
            fontSize: 13
        ),),

      ),

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
}*/

class DeviceAddPage extends StatefulWidget {
  final DeviceManager deviceManager;

  const DeviceAddPage({Key? key, required this.deviceManager})
      : super(key: key);

  @override
  State<DeviceAddPage> createState() => _DeviceAddPageState();
}

class _DeviceAddPageState extends State<DeviceAddPage> {
  TextEditingController nameController = TextEditingController();
  final DeviceType _deviceType = DeviceType.ioBroker;

  List<DataPoint> dataPoints = [];

  IconData? currentSelectedIconData = Icons.home;

  final TextEditingController idController = TextEditingController();
  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Device"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.save),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: IconPickerTemplate(
                onChange: (d) => {currentSelectedIconData = d},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
              child: const Text("Data Points:", style: TextStyle(fontSize: 17)),
            ),
            for (DataPoint dataPoint in dataPoints)
              Dismissible(
                key: ValueKey(dataPoint),
                onDismissed: (d) {
                  setState(() {
                    dataPoints.remove(dataPoint);
                  });
                },
                background: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerRight,
                ),
                direction: DismissDirection.endToStart,
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  child: DataPointInputField(
                    dataPoint: dataPoint,
                  ),
                ),
              ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataPoints
                        .add(DataPoint(name: "name", device: null, id: "id"));
                  });
                },
                child: const Text("Add Data Point Man."),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => EnumNavigationPage(
                                ioBrokerManager:
                                    Manager.instance!.ioBrokerManager,
                                id: "enum.app",
                                depth: 1,
                                onSelected: onSelected,
                              )));
                },
                child: const Text("Add Enum from IoB."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(String name, List<String> ids) {
    setState(() {
      for (String id in ids) {
        nameController.text = name;
        dataPoints
            .add(DataPoint(name: id.split(".").last, device: null, id: id));
      }
    });
  }

  void save() {
    if (currentSelectedIconData == null || nameController.text.isEmpty) {
      return;
    }
    if (_deviceType == DeviceType.ioBroker) {
      dataPoints.removeWhere((element) =>
          element.name.trim().isEmpty || element.id.trim().isEmpty);
      IoBrokerDevice ioBrokerDevice = IoBrokerDevice(
          iconID: currentSelectedIconData!.codePoint.toRadixString(16),
          name: nameController.text,
          objectID: idController.text,
          dataPoints: dataPoints,
          id: widget.deviceManager.manager.getRandString(12),
          lastUpdated: DateTime.now());
      for (var element in dataPoints) {
        element.device = ioBrokerDevice;
      }
      widget.deviceManager.addDevice(ioBrokerDevice);
      Navigator.pop(context);
    }
  }
}

class DeviceEditPage extends StatefulWidget {
  final DeviceManager deviceManager;
  final Device device;

  const DeviceEditPage(
      {Key? key, required this.deviceManager, required this.device})
      : super(key: key);

  @override
  State<DeviceEditPage> createState() => _DeviceEditPageState();
}

class _DeviceEditPageState extends State<DeviceEditPage> {
  TextEditingController nameController = TextEditingController();
  final DeviceType _deviceType = DeviceType.ioBroker;

  List<DataPoint> dataPoints = [];

  IconData? currentSelectedIconData;
  Icon icon = const Icon(Icons.insert_emoticon);

  @override
  void initState() {
    dataPoints = widget.device.dataPoints ?? [];
    nameController.text = widget.device.name;
    currentSelectedIconData =
        IconData(int.tryParse(widget.device.iconID, radix: 16) ?? 0);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Device"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: save,
        child: const Icon(Icons.save),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: IconPickerTemplate(
                selected: currentSelectedIconData ?? Icons.home,
                onChange: (d) => {currentSelectedIconData = d},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
              child: const Text("Data Points:", style: TextStyle(fontSize: 17)),
            ),
            for (DataPoint dataPoint in dataPoints)
              Dismissible(
                background: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: Container(
                    child: const Icon(Icons.delete_forever),
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  ),
                  alignment: Alignment.centerRight,
                ),
                direction: DismissDirection.endToStart,
                key: ValueKey(dataPoint),
                onDismissed: (d) {
                  setState(() {
                    dataPoints.remove(dataPoint);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: DataPointInputField(
                    dataPoint: dataPoint,
                  ),
                ),
              ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataPoints
                        .add(DataPoint(name: "name", device: null, id: "id"));
                  });
                },
                child: const Text("Add Data Point Man."),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => EnumNavigationPage(
                                ioBrokerManager:
                                    Manager.instance!.ioBrokerManager,
                                id: "enum.app",
                                depth: 1,
                                onSelected: onSelected,
                              )));
                },
                child: const Text("Add Enum from IoB."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(String name, List<String> ids) {
    setState(() {
      for (String id in ids) {
        nameController.text = name;
        dataPoints
            .add(DataPoint(name: id.split(".").last, device: null, id: id));
      }
    });
  }

  void save() {
    if (currentSelectedIconData == null || nameController.text.isEmpty) {
      return;
    }
    if (_deviceType == DeviceType.ioBroker) {
      dataPoints.removeWhere((element) =>
          element.name.trim().isEmpty || element.id.trim().isEmpty);

      IoBrokerDevice ioBrokerDevice = widget.device as IoBrokerDevice;
      ioBrokerDevice.name = nameController.text;
      ioBrokerDevice.iconID =
          currentSelectedIconData!.codePoint.toRadixString(16);
      ioBrokerDevice.dataPoints = dataPoints;
      dataPoints.forEach((element) => {element.device = ioBrokerDevice});
      widget.deviceManager.editDevice(ioBrokerDevice);
      Navigator.pop(context);
    }
  }
}

class DataPointInputField extends StatelessWidget {
  final DataPoint dataPoint;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  DataPointInputField({Key? key, required this.dataPoint}) : super(key: key) {
    nameController.value = TextEditingValue(text: dataPoint.name);
    idController.value = TextEditingValue(text: dataPoint.id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            onChanged: (value) => {dataPoint.name = value},
            decoration: const InputDecoration(labelText: "Name"),
            keyboardType: TextInputType.text,
            controller: nameController,
          ),
        ),
        Container(width: 20),
        Expanded(
          flex: 3,
          child: TextField(
            onChanged: (value) => {dataPoint.id = value},
            decoration: const InputDecoration(labelText: "ID"),
            keyboardType: TextInputType.text,
            controller: idController,
          ),
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => _DataPointInfoDialog(dataPoint: dataPoint));
            },
            icon: const Icon(Icons.info_outline))
      ],
    );
  }
}

class _DataPointInfoDialog extends StatelessWidget {
  final DataPoint dataPoint;

  const _DataPointInfoDialog({Key? key, required this.dataPoint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dataPoint.name + ": " + dataPoint.id),
      scrollable: true,
      content: Column(
        children: [
          TextFormField(
            enabled: false,
            onChanged: (s) {
              if (s.isEmpty) {
                dataPoint.role = null;
              }
              dataPoint.role = s;
            },
            decoration: const InputDecoration(labelText: "Value"),
            controller: TextEditingController(text: dataPoint.value.toString()),
          ),
          TextFormField(
            enabled: false,
            onChanged: (s) {
              if (s.isEmpty) {
                dataPoint.role = null;
              }
              dataPoint.role = s;
            },
            decoration: const InputDecoration(labelText: "Role"),
            controller: TextEditingController(text: dataPoint.role),
          ),
          TextFormField(
            enabled: false,
            onChanged: (s) {
              if (s.isEmpty) {
                dataPoint.role = null;
              }
              dataPoint.role = s;
            },
            decoration: const InputDecoration(labelText: "Name"),
            controller:
                TextEditingController(text: dataPoint.otherDetails?["name"]),
          ),
          ExpansionTile(
            title: const Text("More Information"),
            childrenPadding: const EdgeInsets.only(left: 15, right: 10),
            children: [
              for (String s in dataPoint.otherDetails?.keys
                      .where((element) => element != "name") ??
                  [])
                TextFormField(
                  enabled: false,
                  onChanged: (s) {
                    if (s.isEmpty) {
                      dataPoint.role = null;
                    }
                    dataPoint.role = s;
                  },
                  decoration: InputDecoration(
                      labelText: s.replaceFirst(
                          s.substring(0, 1), s.substring(0, 1).toUpperCase())),
                  controller: TextEditingController(
                      text: dataPoint.otherDetails![s].toString()),
                ),
            ],
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("Back"))
      ],
    );
  }
}

class EnumNavigationPage extends StatelessWidget {
  final IoBrokerManager ioBrokerManager;
  final String id;
  final int depth;
  final Function(String, List<String>) onSelected;

  const EnumNavigationPage(
      {Key? key,
      required this.ioBrokerManager,
      required this.id,
      required this.depth,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Enum"),
      ),
      body: EnumNavigationView(
        id: id,
        ioBrokerManager: ioBrokerManager,
        depth: depth,
        onSelected: onSelected,
      ),
    );
  }
}

class EnumNavigationView extends StatelessWidget {
  int depth;
  final String id;
  final IoBrokerManager ioBrokerManager;
  final Function(String, List<String>) onSelected;

  EnumNavigationView(
      {Key? key,
      required this.id,
      required this.ioBrokerManager,
      required this.depth,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.grey, fontSize: 15),
              children: <TextSpan>[
                for (String s in id.split("."))
                  TextSpan(
                    text: s + ">",
                  )
              ]),
        ),
        for (Enum e in ioBrokerManager.getEnumChildren(id))
          ListTile(
            title: Text(e.name),
            subtitle: Text(e.id),
            onTap: () => {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      EnumNavigationPage(
                    ioBrokerManager: ioBrokerManager,
                    id: e.id,
                    depth: depth + 1,
                    onSelected: onSelected,
                  ),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              )
            },
            trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (e.members.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No members found!"),
                    ));
                  } else {
                    onSelected(e.name, e.members);
                    Navigator.popUntil(context, (route) {
                      depth--;
                      return depth <= -1;
                    });
                  }
                },
                tooltip: "Add"),
          )
      ],
    );
  }
}
