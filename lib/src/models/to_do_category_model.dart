import 'todo_model.dart';

class ToDoCategory {
  final String name;
  final int length;
  // final List<ToDo>? toDoList;
  final int? color;
  String? refrence;

  ToDoCategory(
      this.name,
      this.length,
      //  this.toDoList,
      this.color,
      this.refrence);

  // 6
  factory ToDoCategory.fromJson(Map<String, dynamic> json) =>
      ToDoCategoryFromJson(json);
  // 7
  Map<String, dynamic> toJson() => ToDoCategoryToJson(this);

  @override
  String toString() => 'Pet<$name>';
}

ToDoCategory ToDoCategoryFromJson(Map<String, dynamic> json) {
  return ToDoCategory(
      json['name'] as String,
      json['length'] as int,
      // _convertToDos(json['toDoList'] as List<dynamic>),
      json['color'] as int,
      json['refrence'] as String);
}

// 2
List<ToDo> convertToDos(List<dynamic> toDosMap) {
  final toDos = <ToDo>[];

  for (final toDos in toDosMap) {
    toDos.add(ToDo.fromJson(toDos as Map<String, dynamic>));
  }
  return toDos;
}

// 3
Map<String, dynamic> ToDoCategoryToJson(ToDoCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'length': instance.length,

      // 'toDoList': _toDoList(instance.toDoList),
    };
// 4
List<Map<String, dynamic>>? _toDoList(List<ToDo>? todos) {
  if (todos == null) {
    return null;
  }
  final todosMap = <Map<String, dynamic>>[];
  todos.forEach((vaccination) {
    todosMap.add(vaccination.toJson());
  });
  return todosMap;
}

final todoCatList = [
  ToDoCategory(
      'Buisness',
      20,
      // listTodo,
      0xffD103FC,
      ''),
  ToDoCategory(
      'Personal',
      3,
      //  listTodoTwo,
      0xffD103FC,
      ''),
];
