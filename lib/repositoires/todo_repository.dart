// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:plan_it/repositoires/base_todo_repository.dart';

import 'package:plan_it/src/models/to_do_category_model.dart';

class ToDoRepository extends BaseToDoRepository {
  final FirebaseFirestore _firebaseFirestore;
  ToDoRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addToDoCategory(ToDoCategory toDoCategory, User user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .collection("todos")
        .add(toDoCategory.toDocument());
  }

  Future<List<ToDoCategory>> retrieveUserData(User user) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .collection('todos')
        .get();
    return snapshot.docs
        .map((docSnapshot) => ToDoCategory.fromSnapShot(docSnapshot))
        .toList();
  }

  // Stream<List<ToDoCategory>> retrieveToDos(User user) {
  //   final snapsho = _firebaseFirestore
  //       .collection("Users")
  //       .doc(user.uid)
  //       .collection('todos')
  //       .snapshots()
  //       .asyncMap((event) async {
  //     List<ToDoCategory> todos = [];
  //     for (var document in event.docs) {
  //       var todoCat = ToDoCategory.fromJson(document.data());

  //       todos.add(ToDoCategory(
  //           name: todoCat.name ?? 'hello',
  //           length: todoCat.length,
  //           toDoList: todoCat.toDoList,
  //           color: todoCat.color));
  //     }
  //     print(todos);
  //     return todos;
  //   });
  //   return snapsho;
  // }
}
