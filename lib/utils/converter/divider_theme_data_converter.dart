import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/utils/converter/material_color_converter.dart';

class DividerThemeDataConverter
    implements JsonConverter<DividerThemeData?, Map<String, dynamic>?> {
  const DividerThemeDataConverter();

  @override
  DividerThemeData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return DividerThemeData(
      color: const MaterialColorConverter().fromJson(
        json['color'] as Map<String, dynamic>?,
      ),
      space: (json['space'] as num?)?.toDouble(),
      thickness: (json['thickness'] as num?)?.toDouble(),
      indent: (json['indent'] as num?)?.toDouble(),
      endIndent: (json['endIndent'] as num?)?.toDouble(),
    );
  }

  @override
  Map<String, dynamic>? toJson(DividerThemeData? object) {
    if (object == null) return null;
    return {
      'color': const MaterialColorConverter().toJson(object.color),
      'space': object.space,
      'thickness': object.thickness,
      'indent': object.indent,
      'endIndent': object.endIndent,
    };
  }
}
