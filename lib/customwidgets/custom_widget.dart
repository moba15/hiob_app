import 'package:flutter/material.dart';

class CustomWidget {

  static int typeID = -1;

  String type;
  Widget widget;


  CustomWidget({required Map<String, dynamic> json, this.type = "Error", this.widget = const Text("Error")}) {
    throw UnsupportedError("Unsupported Method call for Custom Widget");
  }



  Map<String, dynamic> toJson() {
    throw UnsupportedError("Unsupported Method call for Custom Widget");
  }


















}