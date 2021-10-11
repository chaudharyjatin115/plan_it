class Task {
  final int? id;
  final String? name;
  final DateTime? date;

  Task(this.id, this.date, this.name);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
    };
  }

  Task.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["title"],
        date = res["date"];
}
