import 'package:flutter/material.dart';

class CustomWidget {

  String type;
  Widget widget;

  CustomWidget(this.type, this.widget);



  Map<String, dynamic> toJson() {
    throw UnsupportedError("Unsupported Method call for Custom Widget");
  }


  bool fromJson(Map<String, dynamic> json) {
    throw UnsupportedError("Unsupported Method call for Custom Widget");
  }















}