import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      fontFamily: 'Helveitca',
      appBarTheme: AppBarTheme(
        color: Color(
          0xff2643C4,
        ),
      ),
    
      primaryColor: Color(0xffD103FC),
      colorScheme: ColorScheme.dark(primary: Color(0xffD103FC)),
      useMaterial3: true,
      
      scaffoldBackgroundColor: Color(
        0xff3D47AF,
      ));
  static final lightTheme = ThemeData(
      primaryIconTheme: IconThemeData(
        color: Color(0xff969DC1),
      ),
      appBarTheme:
          AppBarTheme(iconTheme: IconThemeData(color: Color(0xff373B5E))),
      fontFamily: 'Helvetica',
      scaffoldBackgroundColor: Color(0xffF4F6FD),
      brightness: Brightness.light,
      primaryColor: Color(0xff076AFF),
      colorScheme: ColorScheme.light(primary: Color(0xff076AFF)));
}
