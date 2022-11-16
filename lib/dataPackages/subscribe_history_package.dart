import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class SubscribeSmartHistoryPackage extends DataPackage {

  SubscribeSmartHistoryPackage({required DataPoint dataPoint, required int start, required int end, required int interval}) : super(type: DataPackageType.subscribeHistory, content: {
    "dataPoint": dataPoint.id,
    "start": start,
    "end": end,
    "type": "smart",
    "interval": interval * 1000
  });
}