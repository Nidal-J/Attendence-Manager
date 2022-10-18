import 'package:attendance_manager/database/db_controller.dart';
import 'package:attendance_manager/database/db_operations.dart';
import 'package:attendance_manager/models/course.dart';
import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

class CourseController implements DbOperations<Course> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Course course) async {
    int newRowId = await _database.insert(Course.tableName, course.toMap());
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await _database
        .delete(Course.tableName, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows > 0;
  }

  @override
  Future<List<Course>> read() async {
    int userId =
        SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)!;
    List<Map<String, dynamic>> rowsMap = await _database.query(
      Course.tableName,
      where: 'id = ?',
      whereArgs: [userId],
    );
    return rowsMap.map((rowMap) => Course.fromMap(rowMap)).toList();
  }

  @override
  Future<Course?> show(int id) async {
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Course.tableName, where: 'id = ?', whereArgs: [id]);

    return Course.fromMap(rowsMap.first);
  }

  @override
  Future<bool> update(Course course) async {
    int countOfUpdatedRows = await _database.update(
        Course.tableName, course.toMap(),
        where: 'id = ?', whereArgs: [course.id]);

    return countOfUpdatedRows > 0;
  }
}
