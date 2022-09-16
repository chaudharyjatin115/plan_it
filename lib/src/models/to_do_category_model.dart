import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:plan_it/src/models/todo_model.dart';

class ToDoCategory {
  final String name;
  final int length;
  final List<ToDo?> toDoList;
  final String? color;

  ToDoCategory({
    required this.name,
    required this.length,
    required this.toDoList,
    required this.color,
  });

  @override
  List<Object?> get props => [name, length, toDoList, color];

  Map<String, Object> toDocument() {
    Map toDoCat = Map();
    toDoCat['name'] = name;
    toDoCat['length'] = length;
    toDoCat['toDoList'] = toDoList;
    toDoCat['color'] = color;

    return {
      'name': name,
      'length': length,
      'toDoList': toDoList.map((e) => e).toList(),
      'color': color!,
    };
  }

  factory ToDoCategory.fromJson(Map<String, dynamic> json) => ToDoCategory(
      name: json['name'] as String,
      length: json['length'] as int,
      toDoList: json['toDoList'] as List<ToDo>,
      color: json['color']);

  ToDoCategory.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot)
      : name = documentSnapshot.data()!['name'] as String,
        length = documentSnapshot.data()!.length,
        toDoList = documentSnapshot.data()!['toDoList'] as List<ToDo>,
        color = documentSnapshot.data()!['color'];
}
