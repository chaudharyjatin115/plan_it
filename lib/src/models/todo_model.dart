import 'package:flutter/material.dart';

class ToDo {
  final String taskName;
  final bool isDone;

  ToDo({required this.taskName, required this.isDone});
}

final todoCatList = [
  ToDoCategory('Buisness', 20, listTodo, Colors.blueAccent),
  ToDoCategory('Personal', 3, listTodoTwo, Color(0xffD103FC))
];

class ToDoCategory {
  final String name;
  final int length;
  final List<ToDo> toDoList;
  final Color? color;

  ToDoCategory(this.name, this.length, this.toDoList, this.color);
}
// debug data

final List<ToDo> listTodo = [
  ToDo(taskName: "eat something", isDone: false),
  ToDo(taskName: "code something", isDone: true),
  ToDo(taskName: "write a blog", isDone: false),
  ToDo(taskName: "go out ", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
];
final List<ToDo> listTodoTwo = [
  ToDo(taskName: "eat something", isDone: false),
  ToDo(taskName: "code something", isDone: true),
  ToDo(taskName: "write a blog", isDone: false),
  ToDo(taskName: "go out ", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
];
