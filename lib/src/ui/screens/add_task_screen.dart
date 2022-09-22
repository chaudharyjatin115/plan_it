import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../const/app_constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColor,
          ),
          width: 100,
          child: TextButton(
            child: Text(
              'New Task',
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
            onPressed: (() {}),
          )),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: textColor),
                    shape: BoxShape.circle),
                child: const Icon(
                  CupertinoIcons.xmark,
                  size: 40,
                  semanticLabel: 'cancel',
                  color: textColor,
                )),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter new task',
                      hintStyle: TextStyle(
                          fontSize: 20,
                          color: textColor,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 50,
                      child: Row(children: [
                        IconButton(
                          onPressed: (() {}),
                          icon: Icon(
                            Icons.calendar_today,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: const Text('Today'),
                        )
                      ]),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: textColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),

                    //
                    Container(
                      height: 30,
                      child: IconButton(
                        icon: const Icon(Icons.select_all),
                        onPressed: () {
                          MaterialPicker(
                            pickerColor: Colors.red, //default color
                            onColorChanged: (Color color) {
                              //on color picked
                              print(color);
                            },
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: textColor),
                          shape: BoxShape.circle),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
