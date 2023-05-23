import 'package:flutter/material.dart';
enum CustomThemeBrightness {
  dark,
  light,
  system
}
extension CustomThemeBrightnessExtension on CustomThemeBrightness {
  ThemeMode get themeMode {
    switch(this) {
      case CustomThemeBrightness.dark: 
        return ThemeMode.dark;
      case CustomThemeBrightness.light:
        return ThemeMode.light;
      case CustomThemeBrightness.system:
        return ThemeMode.system;
    }
    
  }
  
  
  
}

enum CustomThemeMaterialVersion {
  material3,
  material2,
}


enum CustomColorSchemeMode {
  fromSeed,
  fromSwatch,
}


class CustomTheme {
  CustomThemeBrightness customThemeBrightness;
  CustomThemeMaterialVersion customThemeMaterialVersion;
  double appBarElevation = 5;
  _CustomColorScheme customColorScheme;
  CustomTheme({required this.customThemeBrightness, required this.customThemeMaterialVersion, required this customColorScheme});

  ThemeData get themeDataLight => ThemeData(
    useMaterial3: customThemeMaterialVersion == CustomThemeMaterialVersion.material3,
      appBarTheme: AppBarTheme(
        elevation: appBarElevation,
      ),
    brightness: Brightness.light
  );

  ThemeData get themeDataDark => ThemeData(
    brightness: Brightness.dark
        
  );
  

  Map<String, dynamic> toJson() => {
    "brightness": customThemeBrightness.index,
    "materialVersion": customThemeMaterialVersion.index,
  };

  factory CustomTheme.fromJson(Map<String, dynamic> json) {
    CustomThemeBrightness customThemeBrightness = CustomThemeBrightness.values[json["brightness"] ?? 0];
    CustomThemeMaterialVersion customThemeMaterialVersion = CustomThemeMaterialVersion.values[json["materialVersion"] ?? 0];
    _CustomColorScheme customColorScheme = _CustomColorScheme(customColorSchemeMode: CustomColorSchemeMode.fromSeed);
    return CustomTheme(customThemeBrightness: customThemeBrightness, customThemeMaterialVersion: customThemeMaterialVersion, customColorScheme: customColorScheme);
  }

}



class _CustomColorScheme {
  CustomColorSchemeMode customColorSchemeMode;
  Color color = Colors.green;
  Brightness brightness = Brightness.dark;

  _CustomColorScheme({required this.customColorSchemeMode});


  ColorScheme get colorScheme {
    switch(customColorSchemeMode) {
      case CustomColorSchemeMode.fromSeed:
        return ColorScheme.fromSeed(seedColor: Colors.black12, brightness: brightness);
        case CustomColorSchemeMode.fromSwatch:
          return ColorScheme.fromSwatch(primarySwatch: Colors.green);
    }
}


}