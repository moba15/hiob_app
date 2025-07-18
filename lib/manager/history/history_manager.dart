import 'package:smart_home/dataPackages/subscribe_history_package.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/history/history_data.dart';
import 'package:smart_home/manager/history/history_subscription.dart';

class HistoryManager {
  //Datapoint id and his subs
  Map<DataPoint, List<HistorySubscription>> subscriptions = {};
  final ConnectionManager connectionManager;

  HistoryManager({required this.connectionManager});

  void subscribeToHistorySmart(
    DataPoint dataPoint,
    int start,
    int end,
    int interval,
  ) {
    if (subscriptions.containsKey(dataPoint)) {
      if (subscriptions[dataPoint]!.any(
        (element) => element.type == SubType.smart,
      )) {
      } else {
        subscriptions[dataPoint] = [HistorySubscription(type: SubType.smart)];
      }
    } else {
      subscriptions[dataPoint] = [HistorySubscription(type: SubType.smart)];
    }

    sendSubscription(dataPoint, start, end, interval);
    //TODO: Fetch data if nec
  }

  bool _isIntervalIsLoaded(HistoryData historyData, int start, int end) {
    return false;
  }

  void sendSubscription(DataPoint dataPoint, int start, int end, int interval) {
    //TODO: Make sure that there can be more than one datapoint with this id

    HistoryData historyData = subscriptions.keys
        .firstWhere((element) => element == dataPoint)
        .historyData;
    if (!_isIntervalIsLoaded(historyData, start, end)) {
      //Send request
      SubscribeSmartHistoryPackage smartHistoryPackage =
          SubscribeSmartHistoryPackage(
            dataPoint: dataPoint,
            start: start,
            end: end,
            interval: interval,
          );
      if (historyData.historyInterval.end < end) {
        historyData.historyInterval.end = end;
      }
      if (historyData.historyInterval.start > start ||
          historyData.historyInterval.start < 0) {
        historyData.historyInterval.start = start;
      }
      connectionManager.sendMsg(smartHistoryPackage);
    }
  }

  void onHistoryUpdate({required List data}) {
    for (Map rawDate in data) {
      String id = rawDate["id"];
      DataPoint dataPoint = subscriptions.keys.firstWhere(
        (element) => element.id == id,
      );
      dataPoint.historyData.addData(rawDate["ts"], rawDate["val"]);
    }
  }
}
