import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan_it/src/models/to_do_category_model.dart';

abstract class BaseToDoRepository {
  Future<void> addToDoCategory(ToDoCategory toDoCategory, User user);
}
