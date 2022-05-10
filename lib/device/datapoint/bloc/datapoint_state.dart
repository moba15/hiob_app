part of 'datapoint_bloc.dart';


class DataPointState extends Equatable {
  final dynamic value;
  final dynamic oldValue;
  
  const DataPointState({required this.value, required this.oldValue});

  @override
  List<Object?> get props => [value];
}

class DataPointInitial extends DataPointState {
  const DataPointInitial({dynamic value, dynamic oldValue})
      : super(value: value, oldValue: oldValue);
  const DataPointInitial.value({dynamic value, dynamic oldValue, required DateTime t}) : super(value: value, oldValue: oldValue);
}
