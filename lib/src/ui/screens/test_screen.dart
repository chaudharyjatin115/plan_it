import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_it/src/bloc/to_do_bloc/bloc/to_do_event.dart';
import 'package:plan_it/src/models/to_do_category_model.dart';
import '../../bloc/to_do_bloc/bloc/to_do_bloc.dart';
import '../../bloc/to_do_bloc/bloc/to_do_state.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<ToDoBloc, ToDoState>(
              builder: (context, state) {
                if (state is LoadedToDoState) {
                  if (state.todos.isEmpty) {
                    return Container(
                      child: const Text('No to dos'),
                    );
                  }
                  return ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          color: Colors.black,
                          child: Text(state.todos[index].name),
                        );
                      }));
                } else {
                  return Container();
                }
                ;
              },
            ),
          ),
          TextButton(
              onPressed: () {
                context.read<ToDoBloc>().add(AddToDoCategoryEvent(ToDoCategory(
                    color: 'red', name: 'buisness', length: 45, toDoList: [])));
              },
              child: const Text('add'))
        ],
      ),
    );
  }
}
