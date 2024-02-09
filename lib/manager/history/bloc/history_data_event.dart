part of 'history_data_bloc.dart';

abstract class HistoryDataEvent {}

class HistoryAddDataEvent extends HistoryDataEvent {
  final int time;
  final dynamic value;

  HistoryAddDataEvent(this.time, this.value) : super();
}
