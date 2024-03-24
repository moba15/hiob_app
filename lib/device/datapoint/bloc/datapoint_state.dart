part of 'datapoint_bloc.dart';

class DataPointState extends Equatable {
  final dynamic value;
  final dynamic oldValue;
  final int ts, lc;

  const DataPointState(
      {required this.value,
      required this.oldValue,
      required this.ts,
      required this.lc});

  @override
  List<Object?> get props => [value];
}

class DataPointInitial extends DataPointState {
  const DataPointInitial(
      {required int ts, required int lc, dynamic value, dynamic oldValue})
      : super(value: value, oldValue: oldValue, ts: ts, lc: lc);

  const DataPointInitial.value({
    required int ts,
    required int lc,
    dynamic value,
    dynamic oldValue,
  }) : super(value: value, oldValue: oldValue, ts: ts, lc: lc);
}
