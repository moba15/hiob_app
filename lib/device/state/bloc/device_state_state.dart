part of 'device_state_bloc.dart';

@immutable
class DeviceState extends Equatable {
  final Map<String, dynamic> values;
  final int updateSequence;

  const DeviceState({this.values = const {}, this.updateSequence = 0});

  dynamic getValue(String? dataPointId) =>
      dataPointId == null ? null : values[dataPointId];

  DeviceState copyWith({Map<String, dynamic>? values}) {
    return DeviceState(
      values: values ?? this.values,
      updateSequence: updateSequence + 1,
    );
  }

  @override
  List<Object?> get props => [updateSequence];
}
