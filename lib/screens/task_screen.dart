import 'package:flutter/material.dart';

import 'package:plan_it/models/dbhelper.dart';
import 'package:plan_it/models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    DBHelper().main();
  }

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
                    children: [TextField()],
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
                            '12',
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
                    future: DBHelper().getTasks(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      '${snapshot.data![index].name}',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Spacer(flex: 1),
                                  ],
                                ),
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
