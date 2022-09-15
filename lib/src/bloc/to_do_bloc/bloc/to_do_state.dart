part of 'to_do_bloc.dart';

abstract class ToDoState extends Equatable {
  const ToDoState();
  
  @override
  List<Object> get props => [];
}

class ToDoInitial extends ToDoState {}
