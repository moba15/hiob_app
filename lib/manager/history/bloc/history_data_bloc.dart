import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/history/history_data.dart';

part 'history_data_event.dart';
part 'history_data_state.dart';

class HistoryDataBloc extends Bloc<HistoryDataEvent, HistoryDataState> {
  StreamSubscription<Map<String, dynamic>>? _historyUpdateSubscription;
  HistoryDataBloc({required DataPoint dataPoint})
    : super(HistoryDataState(historyData: dataPoint.historyData)) {
    _historyUpdateSubscription = dataPoint.historyData.streamController.stream
        .listen((event) {
          add(HistoryAddDataEvent(event["time"], event["value"]));
        });

    on<HistoryDataEvent>((event, emit) {
      emit(HistoryDataState(historyData: dataPoint.historyData));
    });
  }
  @override
  Future<void> close() {
    _historyUpdateSubscription?.cancel();
    return super.close();
  }
}
