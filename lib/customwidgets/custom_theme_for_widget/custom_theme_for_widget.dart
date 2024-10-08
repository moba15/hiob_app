import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class CustomThemeForWidget {
  String id;
  CustomThemeForWidget({required this.id});

  Widget get settingWidget;
  Map<String, dynamic> toJson();
  factory CustomThemeForWidget.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(
        "fromJson method not implemented for abstract class");
  }
}
