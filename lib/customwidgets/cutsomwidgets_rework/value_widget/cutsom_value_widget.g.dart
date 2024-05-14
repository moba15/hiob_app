// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cutsom_value_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomValueWidgetImpl _$$CustomValueWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomValueWidgetImpl(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
    );

Map<String, dynamic> _$$CustomValueWidgetImplToJson(
        _$CustomValueWidgetImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
