import 'package:flutter/material.dart';
import 'package:plan_it/src/models/todo_model.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          title: Text('Hey Olivia whatsup'),
          pinned: true,
          floating: false,
          expandedHeight: 100,
          collapsedHeight: 100,
          actions: [
            Expanded(
              child: Icon(Icons.menu),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 200,
            ),
            Expanded(child: Icon(Icons.search)),
            Expanded(child: Icon(Icons.notifications)),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 150,
            width: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listTodo.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: 150,
                  width: 50,
                );
              }),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, bottom: 10, top: 20),
              child: Container(
                height: 75,
                width: 500,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      value: listTodo[index].isDone,
                      onChanged: ((value) {})),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: IconButton(
                  //       icon: Icon(Icons.circle),
                  //       onPressed: () {},
                  //     ))
                ]),
              ),
            );
          }), childCount: listTodo.length),
        ),
      ],
    ));
  }
}
