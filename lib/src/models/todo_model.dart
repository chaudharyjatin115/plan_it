class ToDo {
  final String taskName;
  final bool isDone;

  ToDo({required this.taskName, required this.isDone});
}

final todoCatList = [
  ToDoCategory('Buisness', 20, listTodo),
  ToDoCategory('Personal', 3, listTodoTwo)
];

class ToDoCategory {
  final String name;
  final int length;
  final List<ToDo> toDoList;

  ToDoCategory(this.name, this.length, this.toDoList);
}
// debug data

final List<ToDo> listTodo = [
  ToDo(taskName: "eat something", isDone: false),
  ToDo(taskName: "code something", isDone: true),
  ToDo(taskName: "write a blog", isDone: false),
  ToDo(taskName: "go out ", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
];
final List<ToDo> listTodoTwo = [
  ToDo(taskName: "eat something", isDone: false),
  ToDo(taskName: "code something", isDone: true),
  ToDo(taskName: "write a blog", isDone: false),
  ToDo(taskName: "go out ", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: false),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
  ToDo(taskName: "excercise", isDone: true),
];
