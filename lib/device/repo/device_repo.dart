import 'package:smart_home/device/ioBObject/ioBState/iob_state.dart';
import 'package:smart_home/device/ioBObject/iob_object.dart';
import 'package:smart_home/device/state_search_filter.dart';

abstract class DeviceRepo {
  StateSearchFilter predefindeRepo;
  DeviceRepo({required this.predefindeRepo});

  Future<List<Map<String, dynamic>>> getRooms();
  Future<List<Map<String, dynamic>>> getFunctions();
  Future<List<String>> getRoles();

  Future<List<IobObject>> fetchAllObjects({StateSearchFilter? filter});
  Future<List<IobObject>> fetchFirstObjectLayer({StateSearchFilter? filter});
  Future<List<IobState>> fetchAllStates();
  Future<List<IobState>> fetchStateByQuery(
      {required String query, StateSearchFilter? filter});
}
