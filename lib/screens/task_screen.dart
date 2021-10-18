import 'package:flutter/material.dart';

import 'package:plan_it/models/dbhelper.dart';
import 'package:plan_it/models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

final textcontroller = TextEditingController();

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    DBHelper().main();
    // DBHelper().main();
  }

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xff50e3a4),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
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
              },
            );
          },
          label: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13.0, 20.0, 13.0, 30.0),
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
                            '18',
                            style: TextStyle(fontSize: 60.0),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('AUG'), Text('2021')],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15.0, top: 15.0),
                      child: Column(
                        children: [
                          Text('MONDAY'),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('12 TASKS')
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: DBHelper().getTask(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    del(snapshot.data[index].id);
                                  });
                                },
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 25.0, bottom: 25.0, left: 8.0),
                                      child: Expanded(
                                        child: Text(
                                          '${snapshot.data[index].name}',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    Checkbox(
                                      value: value,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          value = true;
                                        });
                                      },
                                    ),
                                  ],
                                )),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void del(int id) {
  DBHelper().deleteTask(id);
}

bool setTrue(String val) {
  if (val == 'true') {
    return true;
  } else
    return false;
}
