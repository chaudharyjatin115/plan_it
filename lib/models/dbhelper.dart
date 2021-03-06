import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

import 'task.dart';

class DBHelper {
  Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database =
        await openDatabase(join(await getDatabasesPath(), 'task_database.db'),
            onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY,name TEXT,date INTEGER,isDone TEXT)',
      );
    }, version: 1);
    return database;
  }

  Future<void> insertTask(Task task) async {
    final db = await main();
    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<dynamic>> getTask() async {
    final db = await main();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(
        maps.length,
        (index) => Task(
              id: maps[index]['id'],
              date: maps[index]['date'],
              name: maps[index]['name'],
              isDone: maps[index]['isDone'],
            ));
  }

  Future<void> deleteTask(int id) async {
    final db = await main();
    await db.delete(
      'tasks',
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getDataInMap() async {
    Database database = await this.main();
    return database.query("ahkam_fiqhia");
  }
}
