import 'package:flutter/material.dart';
import 'package:plan_it/src/models/todo_model.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            iconSize: 40,
            icon: Icon(Icons.add),
            onPressed: (() {}),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    height: 70,
                    width: 100,
                    child: Text(
                      'Hey Olivia Whatsup',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(height: 30),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: todoCatList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
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
                            borderRadius: BorderRadius.circular(30.0)),
                        height: 120,
                        width: 200,
                      ),
                    );
                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(height: 50),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, bottom: 10, top: 10),
                  child: Container(
                    height: 75,
                    width: 300,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            checkColor: containerColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            value: listTodo[index].isDone,
                            onChanged: ((value) {})),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          listTodo[index].taskName,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                );
              }), childCount: listTodo.length),
            ),
          ],
        ));
  }
}
