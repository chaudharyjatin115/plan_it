import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_it/src/bloc/todo_bloc/todo_event.dart';
import 'package:plan_it/src/bloc/todo_bloc/todo_state.dart';
import 'package:plan_it/src/models/to_do_category_model.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc()
      : super(ToDoInitialState(false, FirebaseAuth.instance.currentUser!,
            ToDoRepository.getToDoCategory())) {
    on<ToDoEvent>((event, emit) {});
  }
}

abstract class ToDoRepository {
  static Stream<Iterable<ToDoCategory>> getToDoCategory() {
    final User userId = FirebaseAuth.instance.currentUser!;
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    final snapshot = collection
        .doc(userId.uid)
        .collection('todos')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => ToDoCategory.fromJson(doc.data())));
    // .get()
    // .then((value) => ToDoCategory.fromSnapshot(value));

    return snapshot;
  }
}
