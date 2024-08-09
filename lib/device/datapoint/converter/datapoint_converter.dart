import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/manager.dart';

class DataPointIdConverter implements JsonConverter<DataPoint?, String> {
  const DataPointIdConverter();
  @override
  DataPoint? fromJson(String json) {
    DataPoint? d = Manager().deviceManager.getIoBrokerDataPointByObjectID(json);

    return d;
  }

  @override
  String toJson(DataPoint? object) {
    return object?.id ?? "null";
  }
}
