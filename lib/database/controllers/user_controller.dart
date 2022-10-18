// import 'package:database_sqflite/database/db_controller.dart';
// import 'package:database_sqflite/database/db_operations.dart';
// import 'package:sqflite/sqflite.dart';

import 'package:attendance_manager/database/db_controller.dart';
import 'package:attendance_manager/models/process_response.dart';
import 'package:attendance_manager/models/user.dart';
import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:sqflite/sqflite.dart';

class UserController {
  final Database _database = DbController().database;

  Future<ProcessResponse> login(
      {required String email, required String password}) async {
    List<Map<String, dynamic>> rowsMap = await _database.query(
      User.tableName,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (rowsMap.isNotEmpty) {
      User user = User.fromMap(rowsMap.first);
      await SharedPrefController().save(user: user);
    }

    String message = rowsMap.isNotEmpty
        ? 'Login successfully'
        : 'Login failed! Check credentials.';

    return ProcessResponse(message: message, success: rowsMap.isNotEmpty);
  }

  Future<ProcessResponse> register({required User user}) async {
    if (await _isUniqueUserName(email: user.email)) {
      int newRowId = await _database.insert(User.tableName, user.toMap());
      if (newRowId != 0) {
        await SharedPrefController().save(user: user);
      }
      String message = newRowId != 0
          ? 'Account created successfully'
          : 'Failed to create account! try again.';
      return ProcessResponse(message: message, success: newRowId != 0);
    }
    return ProcessResponse(
        message: 'Email already exists, try another', success: false);
  }

  Future<bool> _isUniqueUserName({required String email}) async {
    List<Map<String, dynamic>> rowsMap = await _database
        .query(User.tableName, where: 'email = ?', whereArgs: [email]);

    return rowsMap.isEmpty;
  }
}

//   final Database _database = DbController().database;
//   @override
//   Future<int> create(User user) async {
//     // int newRowId = await _database.rawInsert(
//     //     'INSERT INTO users(name, email, password) VALUES(?,?,?)',
//     //     [user.name, user.email, user.password]);

//     int newRowId = await _database.insert(User.tableName, user.toMap());
//     return newRowId;
//   }

//   // delete row has this id from table
//   // return number of deleted rows
//   @override
//   Future<bool> delete(int id) async {
//     // int countOfDeletedRows =
//     //     await _database.rawDelete('DELETE FROM users WHERE id = ?', [id]);

//     int countOfDeletedRows = await _database
//         .delete(User.tableName, where: 'id = ?', whereArgs: [id]);

//     return countOfDeletedRows > 0;

//     // delete all rows from the table:
//     //   _database.rawDelete('DELETE FROM users');  or
//     //   _database.delete(User.tableName);
//   }

//   @override
//   Future<List<User>> read() async {
//     // List<Map<String, dynamic>> rowsMap =
//     //     await _database.rawQuery('SELECT * FROM users');
//     List<Map<String, dynamic>> rowsMap = await _database.query(User.tableName);
//     return rowsMap.map((rowMap) => User.fromMap(rowMap)).toList();
//   }

//   @override
//   Future<User?> show(int id) async {
//     // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM users WHERE id = ?', [id]);
//     List<Map<String, dynamic>> rowsMap =
//         await _database.query(User.tableName, where: 'id=?', whereArgs: [id]);

//     return rowsMap.isNotEmpty ? User.fromMap(rowsMap.first) : null;
//   }

//   @override
//   Future<bool> update(User user) async {
//     // int countOfUpdatedRows = await _database.rawUpdate(
//     //     'UPDATE users SET name = ?, email = ?, password = ? WHERE id =?',
//     //     [user.name, user.email, user.password, user.id]);
//     int countOfUpdatedRows = await _database.update(
//         User.tableName, user.toMap(),
//         where: 'id = ?', whereArgs: [user.id]);

//     return countOfUpdatedRows > 0;
//   }
// }
