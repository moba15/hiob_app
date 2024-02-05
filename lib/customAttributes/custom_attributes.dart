import 'package:flutter/material.dart';

import '../device/device.dart';

part 'custom_device_attribute.dart';

part 'custom_text_attribute.dart';

abstract class CustomAttribute<T> {
  static String typeID = "custom";

  T data;

  CustomAttribute({required this.data});

  Map<String, dynamic> toJson();

  Widget get getSettingWidget;

  factory CustomAttribute.fromJSON(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
