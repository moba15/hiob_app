part of 'datapoint_bloc.dart';

abstract class DataPointEvent extends Equatable {
  const DataPointEvent();
  @override
  List<Object?> get props => [];
}


class DataPointValueUpdate extends DataPointEvent {
  final dynamic value;
  final dynamic oldValue;

  const DataPointValueUpdate({required this.value, required this.oldValue});
}

class DataPointValueUpdateRequest extends DataPointEvent {
  final dynamic value;
  final dynamic oldValue;
  const DataPointValueUpdateRequest({required this.value, required this.oldValue});
}