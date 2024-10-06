import 'package:flutter/material.dart';

abstract class CustomThemeForWidget {
  String id;
  CustomThemeForWidget({required this.id});

  Widget get settingWidget;
}
