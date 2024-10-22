import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class MaterialColorConverter
    implements JsonConverter<Color?, Map<String, dynamic>?> {
  const MaterialColorConverter();
  @override
  Color? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Color.fromARGB(
        json["alpha"], json["red"], json["green"], json["blue"]);
  }

  @override
  Map<String, dynamic>? toJson(Color? object) {
    if (object == null) {
      return null;
    }
    return {
      "alpha": object.alpha,
      "blue": object.blue,
      "red": object.red,
      "green": object.green,
    };
  }
}
