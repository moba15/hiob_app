import 'package:flutter/material.dart';
enum CustomThemeType {
  material3Dark
}

abstract class CustomTheme {
  CustomThemeType type;
  CustomTheme({required this.type});

  ThemeData get themeData;

  Map<String, dynamic> toJson();

  factory CustomTheme.fromJson(Map<String, dynamic> json) {

    CustomThemeType type = CustomThemeType.values[json["type"]];

    switch (type){
      case CustomThemeType.material3Dark:
        return Material3DarkCustomTheme.fromJson(json);
    }


    // TODO: implement CustomTheme.fromJson
    throw UnimplementedError();
  }





}


class Material3DarkCustomTheme extends CustomTheme {
  Color seedColor;
  Material3DarkCustomTheme({this.seedColor = Colors.green}): super(type: CustomThemeType.material3Dark);





  @override
  ThemeData get themeData {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() => {
    "type": type.index,
    "seedColor": seedColor.value
  };


  factory Material3DarkCustomTheme.fromJson(Map<String, dynamic> json) {
    return Material3DarkCustomTheme(seedColor: Color(json["seedColor"]));
  }

}