import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customAttributes/custom_attributes.dart';

class CustomString implements CustomAttribute<String> {

  @override
  String data;

  @override
  Widget widget;


  CustomString(this.data, this.widget);



}