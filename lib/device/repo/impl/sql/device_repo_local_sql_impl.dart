import 'package:smart_home/device/ioBObject/ioBState/iob_state.dart';
import 'package:smart_home/device/ioBObject/iob_object.dart';
import 'package:smart_home/device/repo/device_repo.dart';
import 'package:smart_home/device/state_search_filter.dart';

class DeviceRepoLocalSqlImpl extends DeviceRepo {
  DeviceRepoLocalSqlImpl({required StateSearchFilter predefindeRepo})
      : super(predefindeRepo: predefindeRepo);

  @override
  Future<List<IobObject>> fetchAllObjects({StateSearchFilter? filter}) {
    // TODO: implement fetchAllObjects
    throw UnimplementedError();
  }

  @override
  Future<List<IobState>> fetchAllStates() {
    // TODO: implement fetchAllStates
    throw UnimplementedError();
  }

  @override
  Future<List<IobObject>> fetchFirstObjectLayer({StateSearchFilter? filter}) {
    // TODO: implement fetchFirstObjectLayer
    throw UnimplementedError();
  }

  @override
  Future<List<IobState>> fetchStateByQuery(
      {required String query, StateSearchFilter? filter}) {
    // TODO: implement fetchStateByQuery
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getFunctions() {
    // TODO: implement getFunctions
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getRoles() {
    // TODO: implement getRoles
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getRooms() {
    // TODO: implement getRooms
    throw UnimplementedError();
  }
}
