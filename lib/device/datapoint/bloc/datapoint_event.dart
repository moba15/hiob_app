part of 'datapoint_bloc.dart';

abstract class DataPointEvent extends Equatable {
  const DataPointEvent();
  @override
  List<Object?> get props => [];
}


class DataPointValueUpdate extends DataPointEvent {
  final dynamic value;

  const DataPointValueUpdate({required this.value});
}

class DataPointValueUpdateRequest extends DataPointEvent {
  final dynamic value;

  const DataPointValueUpdateRequest({required this.value});
}