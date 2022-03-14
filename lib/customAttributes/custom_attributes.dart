import 'package:flutter/material.dart';

part 'custom_text_attribute.dart';

abstract class CustomAttribute<T> {
  static String typeID = "custom";

  final T data;

  const CustomAttribute({required this.data});

  Map<String, dynamic> toJson();

  Widget get getSettingWidget;

  factory CustomAttribute.fromJSON(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}