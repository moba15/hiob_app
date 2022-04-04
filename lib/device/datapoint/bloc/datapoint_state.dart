part of 'datapoint_bloc.dart';


class DataPointState extends Equatable {
  final dynamic value;
  
  const DataPointState({required this.value,});

  @override
  List<Object?> get props => [value];
}

class DataPointInitial extends DataPointState {
  const DataPointInitial({dynamic value})
      : super(value: value);
  const DataPointInitial.value({dynamic value, required DateTime t}) : super(value: value);
}
