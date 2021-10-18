import 'package:flutter/material.dart';
import 'package:plan_it/models/dbhelper.dart';
import 'package:plan_it/models/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

final textcontroller = TextEditingController();

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: textcontroller,
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  DBHelper().insertTask(Task(
                    name: textcontroller.text,
                    isDone: 'false',
                  ));
                });
              },
              child: Container(
                child: Text('Add Task'),
              ))
        ],
      ),
    );
  }
}
