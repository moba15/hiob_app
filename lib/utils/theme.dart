import 'package:flutter/material.dart';

extension Material3Theme on ThemeData {
  static ThemeData get darkMaterial3Theme {
    ThemeData themeData = ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.dark),
      
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(

        )
      )

    );

    return themeData;
  }


  static ThemeData get lightMaterial3Theme {
    ThemeData themeData = ThemeData.light(useMaterial3: true).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 10,

        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light),
        inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(

            )
        )

    );



    return themeData;
  }
}



extension InputFieldContainer on Container {
  static Container inputContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: child,
    );
  }
}