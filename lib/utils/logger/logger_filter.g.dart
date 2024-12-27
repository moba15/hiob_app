// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomLoggerFilter _$CustomLoggerFilterFromJson(Map<String, dynamic> json) =>
    CustomLoggerFilter(
      logDebug: json['logDebug'] as bool? ?? false,
      logError: json['logError'] as bool? ?? true,
      logInfo: json['logInfo'] as bool? ?? false,
      logVerbose: json['logVerbose'] as bool? ?? false,
    );

Map<String, dynamic> _$CustomLoggerFilterToJson(CustomLoggerFilter instance) =>
    <String, dynamic>{
      'logDebug': instance.logDebug,
      'logInfo': instance.logInfo,
      'logError': instance.logError,
      'logVerbose': instance.logVerbose,
    };
