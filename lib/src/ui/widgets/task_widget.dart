import 'package:flutter/material.dart';
import 'package:plan_it/src/models/todo_model.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SliverList(
      delegate: SliverChildBuilderDelegate(((context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, bottom: 7.0, top: 7.0),
          child: Container(
            height: 70,
            width: 270,
            decoration: BoxDecoration(
              color: dark ? containerColor : Colors.white,
              boxShadow: [],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Checkbox(
                    checkColor: containerColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    value: listTodo[index].isDone,
                    onChanged: ((value) {})),
                SizedBox(
                  width: 40,
                ),
                Text(
                  listTodo[index].taskName,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: dark ? Colors.white : Color(0xff373B5E)),
                ),
              ],
            ),
          ),
        );
      }), childCount: listTodo.length),
    );
  }
}
