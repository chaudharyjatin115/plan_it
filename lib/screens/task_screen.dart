import 'package:flutter/material.dart';
import 'package:plan_it/screens/addTaskscreen.dart';
import 'package:plan_it/widgets/cCard.dart';

class TaskScreen extends StatefulWidget {
  final bool? isDone = false;

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xff50e3a4),
          onPressed: () {
            showModalBottomSheet(context: context, builder: )
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
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        TaskCard(done: false, Textc: 'Get Some Groceries'),
                        TaskCard(done: true, Textc: 'Buy Some Clothes'),
                        TaskCard(done: false, Textc: 'Collect some Documents'),
                        TaskCard(done: false, Textc: 'Change some cash'),
                      ],
                    ),
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
