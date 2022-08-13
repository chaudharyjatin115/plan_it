import 'package:flutter/material.dart';
import 'package:plan_it/src/models/todo_model.dart';
import 'package:plan_it/src/ui/const/app_constants.dart';

class ToDoCategoryWidget extends StatelessWidget {
  const ToDoCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SliverToBoxAdapter(
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width.toDouble(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: todoCatList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${todoCatList[index].toDoList.length} tasks',
                          style: TextStyle(
                              color: Color(0xffADBAEB),
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          todoCatList[index].name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: LinearProgressIndicator(
                          color: todoCatList[index].color,
                          value: todoCatList[index].length.toDouble(),
                          backgroundColor: Colors.grey,
                        ),
                      )
                      
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: dark ? containerColor : Colors.white,
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
