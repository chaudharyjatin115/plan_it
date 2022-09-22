import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      fontFamily: 'Helveitca',
      primaryColor: const Color(0xffD103FC),
      colorScheme: const ColorScheme.dark(primary: Color(0xffD103FC)),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(
        0xff3D47AF,
      ));
  static final lightTheme = ThemeData(
      useMaterial3: true,
      primaryIconTheme: const IconThemeData(
        color: Color(0xff969DC1),
      ),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Color(0xff373B5E))),
      fontFamily: 'Helvetica',
      scaffoldBackgroundColor: const Color(0xffF4F6FD),
      brightness: Brightness.light,
      primaryColor: const Color(0xff076AFF),
      colorScheme: const ColorScheme.light(primary: Color(0xff076AFF)));
}
