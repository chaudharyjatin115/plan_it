import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(1)
  String? title;

  @HiveField(2)
  bool? isDone;
  Task({this.title, this.isDone});
}
