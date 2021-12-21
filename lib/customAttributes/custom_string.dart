import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customAttributes/custom_attributes.dart';

class CustomString implements CustomAttribute<String> {

  static int typeID = 0;

  @override
  late String data;

  @override
  late Widget widget;


  CustomString({required Map<String, dynamic> json}) {
    data = json!["data"];
  }


  @override
  Map<String, dynamic> toJson() {
    return {
      "typeID" : typeID,
      "data": data,
    };
  }



}