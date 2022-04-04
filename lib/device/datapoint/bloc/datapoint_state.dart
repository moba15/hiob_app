part of 'datapoint_bloc.dart';

enum DeviceStatus {
  unavailable, ready, error
}

class DataPointState extends Equatable {
  final dynamic value;
  final DeviceStatus status;
  
  const DataPointState({required this.value, this.status =  DeviceStatus.unavailable});

  @override
  List<Object?> get props => [status, value];
}

class DataPointInitial extends DataPointState {
  const DataPointInitial({dynamic value})
      : super(value: value);
  const DataPointInitial.value({dynamic value, required DateTime t}) : super(value: value);
}
