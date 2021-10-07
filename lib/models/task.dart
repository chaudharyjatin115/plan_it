class Task {
  final int? id;
  final String? title;

  Task(
    this.id,
    this.title,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  Task.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"];
}
