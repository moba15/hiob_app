import 'dart:async';

import 'package:smart_home/manager/history/history_subscription.dart';

class HistoryData {
  StreamController<Map<String, dynamic>> streamController =
      StreamController.broadcast();

  final Map<int, dynamic> loadedHistory = {};
  final HistoryInterval historyInterval = HistoryInterval(start: -1, end: -1);
  final List<HistorySubscription> subs = [];

  HistoryData();

  void fetchHistory(int start, int end) {
    //TODO: Logic here
  }

  void startSub(HistorySubscription historySubscription) {
    if (subs.any((element) => element == historySubscription)) {
      return;
    }
    subs.add(historySubscription);
  }

  void addData(int time, dynamic value) {
    streamController.sink.add({"time": time, "value": value});
    loadedHistory[time] = value;

    if (historyInterval.end < time) {
      historyInterval.end = time;
    }
  }
}

class HistoryInterval {
  int start;
  int end;
  bool complete;

  HistoryInterval(
      {required this.start, required this.end, this.complete = true});
}
