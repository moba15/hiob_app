import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class FontWeightConverter implements JsonConverter<FontWeight?, int?> {
  const FontWeightConverter();
  @override
  FontWeight? fromJson(int? json) {
    if (json == null) {
      return null;
    }

    return FontWeight.values.firstWhere(
      (element) => element.index == json,
      orElse: () => FontWeight.normal,
    );
  }

  @override
  int? toJson(FontWeight? object) {
    if (object == null) {
      return null;
    }
    return object.index;
  }
}
