import 'package:flutter/material.dart';
import 'package:plan_it/src/models/todo_model.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class ToDoCategoryWidget extends StatelessWidget {
  const ToDoCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: todoCatList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      '${todoCatList[index].toDoList.length} tasks',
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Text(todoCatList[index].name),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1.0,
//
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                height: 120,
                width: 200,
              ),
            );
          }),
        ),
      ),
    );
  }
}
