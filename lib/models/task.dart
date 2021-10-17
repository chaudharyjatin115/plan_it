class Task {
  final int? id;
  final String? name;
  final String? date;
  late final String? isDone;

  Task({this.id, this.date, this.name, this.isDone});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'isDone': isDone,
    };
  }

  Task.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["title"],
        date = res["date"],
        isDone = res["isDone"];
}
