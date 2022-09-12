import 'package:plan_it/src/models/to_do_category_model.dart';

abstract class ToDoEvent {}

class AddToDoCategoryEvent implements ToDoEvent {
  final String name;
  final int color;
  final int length;
  AddToDoCategoryEvent({
    required this.name,
    required this.color,
    required this.length,
  });
}

class InitialToDoCategoryEvent implements ToDoEvent {}
