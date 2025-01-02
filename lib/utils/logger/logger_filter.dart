import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'logger_filter.g.dart';

@JsonSerializable()
class CustomLoggerFilter extends TalkerFilter {
  bool logDebug = false;
  bool logInfo = true;
  bool logError = true;
  bool logVerbose = false;
  CustomLoggerFilter(
      {this.logDebug = false,
      this.logError = true,
      this.logInfo = false,
      this.logVerbose = false});
  @override
  bool filter(TalkerData item) {
    switch (item.logLevel) {
      case null:
        return true;
      case LogLevel.critical:
        return true;
      case LogLevel.error:
        return logError;
      case LogLevel.debug:
        return logDebug;
      case LogLevel.verbose:
        return logVerbose;
      case LogLevel.warning:
        return true;
      case LogLevel.info:
        return logInfo;
    }
  }

  factory CustomLoggerFilter.fromJson(Map<String, dynamic> json) =>
      _$CustomLoggerFilterFromJson(json);

  Map<String, dynamic> toJson() => _$CustomLoggerFilterToJson(this);
}
