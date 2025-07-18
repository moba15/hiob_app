import 'dart:async';

import 'package:smart_home/manager/file_manager.dart';

enum EnumUpdateState { loading, finished, none }

class IoBrokerManager {
  final String key = "IoBrokerSettings";

  bool loaded = false;
  bool connected = false;
  FileManager fileManager;
  String mainIp = "10.0.2.2";
  int port = 8090;
  String user = "user";
  String password = "password";
  bool secureBox = false;
  String secureKey = "";
  bool useSecondaryAddress = false;
  String knownNetwork = "";
  String secondaryAddress = "";

  bool usePwd = true;

  bool useSecureConnection = false;

  final StreamController statusStreamController = StreamController();

  bool isUpdating = false;
  IoBrokerManager({required this.fileManager});

  void load() async {
    if ((await fileManager.containsKey(key))) {
      Map<String, dynamic>? settings = await fileManager.getMap(key);
      mainIp = settings?["ip"] ?? "10.0.2.2";
      port = settings?["port"] ?? 8090;
      user = settings?["user"] ?? "user";
      password = settings?["password"] ?? "password";
      secureBox = settings?["secureBox"] ?? false;
      secureKey = settings?["secureKey"] ?? "";
      knownNetwork = settings?["knownNetwork"] ?? "";
      secondaryAddress = settings?["secondaryAddress"] ?? "";
      useSecondaryAddress = settings?["useSecondaryAddress"] ?? false;
      useSecureConnection = settings?["useSecureConnection"] ?? false;

      usePwd = settings?["usePWD"] ?? true;
    } else {
      mainIp = "10.0.2.2";
      port = 8090;
    }
    //TODO Load devices

    statusStreamController.add(true);
    statusStreamController.close();
  }

  void changeSecurebox(bool secureBox) async {
    this.secureBox = secureBox;
    await _save();
  }

  void changeSecurekey(String secureKey) async {
    this.secureKey = secureKey;
    await _save();
  }

  void changeIp(String mainIp) async {
    this.mainIp = mainIp;
    _save();
  }

  void changePort(int port) async {
    this.port = port;
    await _save();
  }

  Future<void> _save() async {
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "secureBox": secureBox,
      "secureKey": secureKey,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress,
      "usePWD": usePwd,
      "useSecureConnection": useSecureConnection,
    });
  }

  void changeUser(String user) async {
    this.user = user;
    _save();
  }

  void changePassword(String password) async {
    this.password = password;
    _save();
  }

  void changeKnownNetwork(String knownNetwork) async {
    this.knownNetwork = knownNetwork;
    _save();
  }

  void changeSecondaryAddress(String secondaryAddress) async {
    this.secondaryAddress = secondaryAddress;
    _save();
  }

  void changeUseSecondaryAddress(bool useSecondaryAddress) async {
    this.useSecondaryAddress = useSecondaryAddress;
    _save();
  }

  void changeUsePWD(bool usePwd) {
    this.usePwd = usePwd;
    _save();
  }

  void changeUseSecureCon(bool useSecCon) {
    useSecureConnection = useSecCon;
    _save();
  }
}
