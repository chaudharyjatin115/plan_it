import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: Color(
          0xff3450A1,
        ),
      ),
    
      primaryColor: Color(0xffeb06ff),
      colorScheme: ColorScheme.dark(primary: Color(0xffeb06ff)),
      useMaterial3: true,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Color(
        0xff3450A1,
      ));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: Color(0xff3450a1),
      colorScheme: ColorScheme.light(primary: Color(0xff324da4)));
}
