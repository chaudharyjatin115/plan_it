import 'package:flutter/material.dart';
import 'package:plan_it/data/dummy_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'todo_model.dart';

class ToDoCategory {
  final String name;
  final int length;
  final List<ToDo> toDoList;
  final int? color;
  String? refrenceId;

  ToDoCategory(
      this.name, this.length, this.toDoList, this.color, this.refrenceId);
}

final todoCatList = [
  ToDoCategory('Buisness', 20, listTodo, 0xffD103FC, ''),
  ToDoCategory('Personal', 3, listTodoTwo, 0xffD103FC, ''),
];
