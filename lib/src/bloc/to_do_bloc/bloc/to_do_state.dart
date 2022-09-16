import 'package:equatable/equatable.dart';

import '../../../models/to_do_category_model.dart';

class ToDoState extends Equatable {
  const ToDoState();
  @override
  List<Object?> get props => [];
}

class LoadingToDoState extends ToDoState {}

class LoadedToDoState extends ToDoState {
  final List<ToDoCategory> todos;
  LoadedToDoState({
    required this.todos,
  });

  @override
  List<Object?> get props => [todos];
}

class ToDoInitial extends ToDoState {}

class ToDoCategoryAddedState extends ToDoState {}

class ShowColorPickerState extends ToDoState {}
