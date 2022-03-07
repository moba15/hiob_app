import 'package:flutter/material.dart';

class CustomAttribute<T> {

  static int typeID = -1;

  T data;
  Widget widget;
  CustomAttribute(this.data, this.widget);

  Map<String, dynamic> toJson() {
    throw UnsupportedError("This Methode is unsupported for CustomAttribute ");
  }






}