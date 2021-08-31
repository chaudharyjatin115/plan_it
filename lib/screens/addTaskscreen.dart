import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

List<String> tasks = [];

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextField(),
          ),
          TextButton(
            onPressed: () {
              tasks.add('hello');
            },
            child: Text('Add Task'),
          )
        ],
      ),
    );
  }
}
