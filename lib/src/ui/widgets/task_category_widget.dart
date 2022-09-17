import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:plan_it/src/ui/const/app_constants.dart';

import '../../bloc/to_do_bloc/bloc/to_do_bloc.dart';
import '../../bloc/to_do_bloc/bloc/to_do_state.dart';

class ToDoCategoryWidget extends StatelessWidget {
  const ToDoCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SliverToBoxAdapter(
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width.toDouble(),
        child:
            //

            BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
          if (state is LoadedToDoState) {
            if (state.todos.isEmpty) {
              return Container(
                height: 30,
                child: Text('No ToDos'),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.todos.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
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
                                '56',
                                // '67',
                                // '${todoCatList[index].toDoList.length} tasks',
                                style: TextStyle(
                                    color: taskLenghtColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                state.todos[index].name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: LinearProgressIndicator(
                                color: Colors.black,
                                value: 45,
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
                            color: dark
                                ? Colors.black.withOpacity(0.3)
                                : Colors.white,
                            spreadRadius: 3.0,
                            //
                            blurRadius: 6,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 130,
                      width: 200,
                    ),
                  );
                }),
              );
            }
          } else if (state is LoadingToDoState) {
            return Container(
              height: 40,
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return Container();
          }
          ;
        }),
      ),
    );
  }
}
