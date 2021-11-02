import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:plan_it/models/dbhelper.dart';
import 'package:plan_it/models/task.dart';
import 'package:plan_it/provider/provider.dart';
import 'package:plan_it/screens/add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Task? title;
  Box<Task>? todosBox;

  @override
  Widget build(BuildContext context) {
    bool val = false;
    DateFormat formatter = DateFormat('MMM');
    DateFormat dayformat = DateFormat('EEEE');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      child: AddTask(),
                    ),
                  ));
        },
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8.0, right: 10.0),
                    child: Column(
                      children: [
                        Text(
                          '${DateTime.now().day}',
                          style: TextStyle(fontSize: 60.0),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${formatter.format(DateTime.now())}'),
                        Text('${DateTime.now().year}'),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15.0, top: 15.0),
                    child: Column(
                      children: [
                        Text('${dayformat.format(DateTime.now())}'),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('TASKS')
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ValueListenableBuilder(
                  valueListenable: Hive.box<Task>('TODOs').listenable(),
                  builder: (context, Box<Task> _notesBox, _) {
                    todosBox = _notesBox;
                    return ListView.builder(
                        itemCount: _notesBox.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          final todo = todosBox!.getAt(index);
                          bool? ne = todo!.isDone;
                          return CheckboxListTile(
                            title: Text(todo.title.toString()),
                            value: ne,
                            onChanged: (bool? newValue) {
                              setState(() {
                                ne = newValue;
                              });
                            },
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
