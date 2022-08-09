import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      primaryColor: Color(0xffeb06ff),
      colorScheme: ColorScheme.dark(),
      useMaterial3: true,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Color(
        0xff324DA4,
      ));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: Color(0xff3450a1),
      colorScheme: ColorScheme.light(primary: Color(0xff324da4)));
}

final appThemeDataDark = ThemeData(backgroundColor: Color(0xff344FA1));
