// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_input_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomInputWidgetImpl _$$CustomInputWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomInputWidgetImpl(
      name: json['name'] as String,
      hintText: json['hintText'] as String,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      suffix: json['suffix'] as String?,
    );

Map<String, dynamic> _$$CustomInputWidgetImplToJson(
        _$CustomInputWidgetImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hintText': instance.hintText,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'suffix': instance.suffix,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
