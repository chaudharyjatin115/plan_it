import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'task.dart';

class DbHelper {
  DbHelper();
  static final DbHelper dataBase = DbHelper();
  static Database? _database;

  Future<Database?> get database async {
    // ignore: unnecessary_null_comparison
    if (database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'todo_app_db'),
        onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT,task TEXT NOT NULL)''');
    }, version: 1);
  }

  addNewTask(Task newTask) async {
    final db = await initDatabase();

    db!.insert("tasks", newTask.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTask(int id) async {
    final db = await initDatabase();
    await db.delete('tasks', where: "id=?", whereArgs: [id]);
  }

  Future<dynamic> getTask() async {
    final db = await database;
    var res = await db!.query("tasks");
    if (res.length == 0) {
      return null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : Null;
    }
  }
}
