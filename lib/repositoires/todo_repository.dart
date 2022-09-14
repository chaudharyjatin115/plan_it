// ignore_for_file: unused_import

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
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
}
