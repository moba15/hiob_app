part of 'datapoint_bloc.dart';

class DataPointState extends Equatable {
  final dynamic value;

  const DataPointState({required this.value});

  @override
  List<Object?> get props => [value];
}

class DataPointInitial extends DataPointState {
  const DataPointInitial({super.value});

  const DataPointInitial.value({super.value, required DateTime t});
}
