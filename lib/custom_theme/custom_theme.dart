import 'package:flutter/material.dart';

enum CustomThemeBrightness { dark, light, system }

extension CustomThemeBrightnessExtension on CustomThemeBrightness {
  ThemeMode get themeMode {
    switch (this) {
      case CustomThemeBrightness.dark:
        return ThemeMode.dark;
      case CustomThemeBrightness.light:
        return ThemeMode.light;
      case CustomThemeBrightness.system:
        return ThemeMode.system;
    }
  }
}

enum CustomThemeMaterialVersion { material3, material2 }

enum CustomColorSchemeMode { fromSeed, fromSwatch }

class CustomTheme {
  CustomThemeBrightness customThemeBrightness;
  CustomThemeMaterialVersion customThemeMaterialVersion;
  double appBarElevation;
  CustomColorScheme customColorScheme = const CustomColorScheme(
    customColorSchemeMode: CustomColorSchemeMode.fromSeed,
  );
  double textScale = 1;

  CustomTheme({
    required this.customThemeBrightness,
    required this.customThemeMaterialVersion,
    this.customColorScheme = const CustomColorScheme(
      customColorSchemeMode: CustomColorSchemeMode.fromSeed,
    ),
    this.appBarElevation = 5,
    this.textScale = 1,
  });

  ThemeData get themeDataLight => ThemeData(
    useMaterial3:
        customThemeMaterialVersion == CustomThemeMaterialVersion.material3,
    appBarTheme: AppBarTheme(
      elevation: appBarElevation,
      //backgroundColor: Colors.green[300]
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    dividerColor: Colors.transparent,
    colorScheme: customColorScheme.colorScheme(Brightness.light),
    brightness: Brightness.light,
  );

  ThemeData get themeDataDark =>
      ThemeData.dark(
        useMaterial3:
            customThemeMaterialVersion == CustomThemeMaterialVersion.material3,
      ).copyWith(
        appBarTheme: AppBarTheme(elevation: appBarElevation),
        dividerColor: Colors.transparent,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        brightness: Brightness.dark,
        colorScheme: customColorScheme.colorScheme(Brightness.dark),
        primaryTextTheme: const TextTheme(),
      );

  Map<String, dynamic> toJson() => {
    "brightness": customThemeBrightness.index,
    "materialVersion": customThemeMaterialVersion.index,
    "appBarElevation": appBarElevation,
    "colorScheme": customColorScheme.toJson(),
    "textScale": textScale,
  };

  factory CustomTheme.fromJson(Map<String, dynamic> json) {
    CustomThemeBrightness customThemeBrightness =
        CustomThemeBrightness.values[json["brightness"] ?? 0];
    CustomThemeMaterialVersion customThemeMaterialVersion =
        CustomThemeMaterialVersion.values[json["materialVersion"] ?? 0];
    CustomColorScheme customColorScheme = CustomColorScheme.fromJson(
      json["colorScheme"],
    );
    return CustomTheme(
      customThemeBrightness: customThemeBrightness,
      customThemeMaterialVersion: customThemeMaterialVersion,
      customColorScheme: customColorScheme,
      appBarElevation: json["appBarElevation"] ?? 5,
      textScale: json["textScale"] ?? 1,
    );
  }

  CustomTheme copyOf({
    CustomThemeBrightness? customThemeBrightness,
    CustomThemeMaterialVersion? customThemeMaterialVersion,
    double? appBarElevation,
    CustomColorScheme? customColorScheme,
    double? textScale,
  }) {
    return CustomTheme(
      customThemeBrightness:
          customThemeBrightness ?? this.customThemeBrightness,
      customThemeMaterialVersion:
          customThemeMaterialVersion ?? this.customThemeMaterialVersion,
      appBarElevation: appBarElevation ?? this.appBarElevation,
      customColorScheme: customColorScheme ?? this.customColorScheme,
      textScale: textScale ?? this.textScale,
    );
  }
}

class CustomColorScheme {
  final CustomColorSchemeMode customColorSchemeMode;
  final Color color;

  const CustomColorScheme({
    required this.customColorSchemeMode,
    this.color = Colors.green,
  });

  factory CustomColorScheme.fromJson(Map<String, dynamic> json) {
    return CustomColorScheme(
      customColorSchemeMode:
          CustomColorSchemeMode.values[json["customColorSchemeMode"]],
      color: Color(json["color"] ?? 255),
    );
  }

  ColorScheme colorScheme(Brightness brightness) {
    switch (customColorSchemeMode) {
      case CustomColorSchemeMode.fromSeed:
        return ColorScheme.fromSeed(seedColor: color, brightness: brightness);
      case CustomColorSchemeMode.fromSwatch:
        return ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          brightness: brightness,
        );
    }
  }

  Map<String, dynamic> toJson() => {
    "customColorSchemeMode": customColorSchemeMode.index,
    "color": color.value,
  };
}
