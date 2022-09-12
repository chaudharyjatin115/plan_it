import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:plan_it/src/bloc/auth_bloc/auth_state.dart';
import 'package:plan_it/src/models/to_do_category_model.dart';

@immutable
abstract class ToDoState {
  final bool isLoading;
  final User? user;
  final Stream<Iterable<ToDoCategory>> toDoCategory;

  ToDoState(
    this.isLoading,
    this.user,
    this.toDoCategory,
  );
}

class AddToDoCategory extends ToDoState {
  AddToDoCategory(
      bool isLoading, User? user, Stream<Iterable<ToDoCategory>> toDoCategory)
      : super(
          isLoading,
          user,
          toDoCategory,
        );
}

class AddToDo extends ToDoState {
  AddToDo(
      bool isLoading, User? user, Stream<Iterable<ToDoCategory>> toDoCategory)
      : super(isLoading, user, toDoCategory);
}

class DeleteToDo extends ToDoState {
  DeleteToDo(
      bool isLoading, User? user, Stream<Iterable<ToDoCategory>> toDoCategory)
      : super(isLoading, user, toDoCategory);
}

class ToDoInitialState extends ToDoState {
  ToDoInitialState(
      bool isLoading, User? user, Stream<Iterable<ToDoCategory>> toDoCategory)
      : super(isLoading, user, toDoCategory);
}
