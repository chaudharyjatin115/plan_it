import 'package:equatable/equatable.dart';
import 'package:plan_it/src/models/to_do_category_model.dart';

class ToDoCategoryEvent extends Equatable {
  const ToDoCategoryEvent();

  @override
  List<Object> get props => [];
}

class WatchToDoCategoryEvent extends ToDoCategoryEvent {}

class AddToDoCategoryEvent extends ToDoCategoryEvent {
  final ToDoCategory toDoCategory;
  AddToDoCategoryEvent(this.toDoCategory);
}
