import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plan_it/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Oswald',
      ),
      home: TaskScreen(),
    );
  }
}
