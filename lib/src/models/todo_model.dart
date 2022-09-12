class ToDo {
  final String taskName;
  final bool isDone;

  ToDo({
    required this.taskName,
    required this.isDone,
  });

  // 3
  factory ToDo.fromJson(Map<String, dynamic> json) => _toDoFromJson(json);
  // 4
  Map<String, dynamic> toJson() => _toDoToJson(this);

  @override
  String toString() => 'ToDo<$ToDo>';
}

ToDo _toDoFromJson(Map<String, dynamic> json) {
  return ToDo(
    taskName: json['taskName'],
    isDone: json['isDone'],
  );
}

// 2
Map<String, dynamic> _toDoToJson(ToDo instance) => <String, dynamic>{
      'taskName': instance.taskName,
      'isDone': instance.isDone,
    };


// debug data

