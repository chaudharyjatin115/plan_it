// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plan_it/repositoires/base_todo_repository.dart';

import 'package:plan_it/src/models/to_do_category_model.dart';

class ToDoRepository extends BaseToDoRepository {
  final FirebaseFirestore _firebaseFirestore;
  ToDoRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addToDoCategory(ToDoCategory toDoCategory) {
    return _firebaseFirestore
        .collection('todos')
        .add(toDoCategory.toDocument());
  }

  Stream<List<ToDoCategory>> retrieveToDos(User user) {
    final snapsho = _firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .collection('todos')
        .snapshots()
        .asyncMap((event) async {
      List<ToDoCategory> todos = [];
      for (var document in event.docs) {
        var todoCat = ToDoCategory.fromJson(document.data());

        todos.add(ToDoCategory(
            name: todoCat.name ?? 'hello',
            length: todoCat.length,
            toDoList: todoCat.toDoList,
            color: todoCat.color));
      }
      print(todos);
      return todos;
    });
    return snapsho;
  }
}
