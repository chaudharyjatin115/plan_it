import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
AddTask({Key? key}) : super(key: key);
final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
                      children: [
                        TextField(
                          controller: textcontroller,
                          autofocus: true,
                          textAlign: TextAlign.center,
                        ),
                        TextButton
                            child: Container(
                              child: Text('Add Task'),
                            ))
                      ],,);
  }
}
