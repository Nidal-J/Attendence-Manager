import 'package:attendance_manager/database/db_controller.dart';
import 'package:attendance_manager/database/db_operations.dart';
import 'package:attendance_manager/models/student.dart';
import 'package:sqflite/sqflite.dart';

class StudentController implements DbOperations<Student> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Student student) async {
    return _database.insert(Student.tableName, student.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    return await _database
            .delete(Student.tableName, where: 'id = ?', whereArgs: [id]) >
        0;
  }

  @override
  Future<List<Student>> read({int courseId = 0}) async {
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Student.tableName, where: 'courseId = ?', whereArgs: [courseId]);
    return rowsMap.map((rowMap) => Student.fromMap(rowMap)).toList();
  }

  @override
  Future<Student?> show(int id) async {
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Student.tableName, where: 'id = ?', whereArgs: [id]);

    return Student.fromMap(rowsMap.first);
  }

  @override
  Future<bool> update(Student student) async {
    return await _database.update(Student.tableName, student.toMap(),
            where: 'id = ?', whereArgs: [student.id]) >
        0;
  }
}
