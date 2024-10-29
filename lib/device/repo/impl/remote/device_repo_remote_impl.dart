import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/ioBObject/ioBState/iob_state.dart';
import 'package:smart_home/device/ioBObject/iob_object.dart';
import 'package:smart_home/device/repo/device_repo.dart';
import 'package:smart_home/device/state_search_filter.dart';
import 'package:smart_home/manager/manager.dart';

class DeviceRepoRemoteImpl extends DeviceRepo {
  final Manager manager = Manager();
  DeviceRepoRemoteImpl({required StateSearchFilter predefindeRepo})
      : super(predefindeRepo: predefindeRepo);

  @override
  Future<List<IobObject>> fetchAllObjects({StateSearchFilter? filter}) {
    throw UnimplementedError();
  }

  @override
  Future<List<IobState>> fetchAllStates() {
    throw UnimplementedError();
  }

  @override
  Future<List<IobObject>> fetchFirstObjectLayer({StateSearchFilter? filter}) {
    throw UnimplementedError();
  }

  @override
  Future<List<IobState>> fetchStateByQuery(
      {required String query, StateSearchFilter? filter}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getFunctions() async {
    Future<DataPackage> test =
        manager.connectionManager.dataPackageStream.firstWhere(
      (element) {
        return element.type == DataPackageType.getIoBFunctions;
      },
    );
    manager.connectionManager.sendMsg(GetIoBFunctionsDataPackage());

    return (await test as GetIoBFunctionsDataPackage).functions ?? [];
  }

  @override
  Future<List<String>> getRoles() {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getRooms() async {
    Future<DataPackage> test =
        manager.connectionManager.dataPackageStream.firstWhere(
      (element) {
        return element.type == DataPackageType.getIoBRooms;
      },
    );
    manager.connectionManager.sendMsg(GetIoBRooms());

    return (await test as GetIoBRooms).rooms ?? [];
  }
}
