import 'package:sqflite/sqflite.dart';
import 'package:todoapp/data/model/task_model.dart';

class TodoTableConst {
  static const String tableName = "userPreferences";

  // Column names
  static const String idField = "id";
  static const String taskTitleField = "taskTitle";
  static const String taskDescriptionField = "taskDescription";
  static const String isCompletedField = "isCompleted";
  static const String createdOnField = "createdOn";

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        $idField INTEGER PRIMARY KEY AUTOINCREMENT,
        $taskTitleField TEXT,
        $taskDescriptionField TEXT,
        $isCompletedField INTEGER,
        $createdOnField TEXT
      )
    ''');
  }

  // Insert data
  static Future<int> insertData(Database db, TaskModel data) async {
    final existingData = await fetchAllData(db);
    if (existingData.isNotEmpty) {
      // Prevent inserting new data if a row already exists
      throw Exception('Data already exists in the database');
    }
    // Insert new data into the database
    return await db.insert(tableName, data.toJson());
  }

  // Fetch all data
  static Future<List<TaskModel>> fetchAllData(Database db) async {
    final result = await db.query(tableName);
    return result.map((data) => TaskModel.fromJson(data)).toList();
  }

  // Fetch single data
  static Future<TaskModel?> fetchSingleData(Database db) async {
    final result = await db.query(tableName, limit: 1);
    if (result.isEmpty) return null;
    return TaskModel.fromJson(result.first);
  }

  // Update data by field
  static Future<int> updateData(Database db, String field, String value) async {
    final existingData = await fetchSingleData(db);
    if (existingData == null) {
      // No data to update
      return -1;
    }
    return await db.update(
      tableName,
      {field: value},
      where: "$idField = ?",
      whereArgs: [existingData.toJson()[idField]],
    );
  }
}
