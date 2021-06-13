import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:tosimpledo/task.dart';

class TasksDatabase {
  static final TasksDatabase instance = TasksDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (database != null) return _database!;

    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';

    await db.execute('''CREATE TABLE $tableTasks (
      ${TaskFields.id} $idType,
      ${TaskFields.title} TEXT NOT NULL,
      ${TaskFields.description} TEXT NOT NULL,
    )''');
  }

  Future create(Task task) async {
    final db = await instance.database;

    final id = await db.insert(tableTasks, task.toJson());

    return task.copy(id: id);
  }

  Future<Task?> readTask(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableTasks,
      columns: TaskFields.values,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Task>> readAllTasks() async {
    final db = await instance.database;

    final result = await db.query(tableTasks, orderBy: '${TaskFields.id} DESC');

    return result.map((json) => Task.fromJson(json)).toList();
  }

  Future<int> update(Task task) async {
    final db = await instance.database;

    return db.update(tableTasks, task.toJson(),
        where: '${TaskFields.id} = ?', whereArgs: [task.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableTasks,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  TasksDatabase._init();
}
