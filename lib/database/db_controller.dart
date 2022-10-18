import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  DbController._();
  static DbController? _instance;
  late Database _database;

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    print('Init DB-------------');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');

    _database = await openDatabase(
      path,
      version: 1,
      onConfigure: (db) {
        print('onConfigure is excuted');
      },
      onOpen: (db) {
        print('onOpened is excuted');
      },
      onCreate: (db, version) {
        print('onCreate is excuted');
        db.execute('CREATE TABLE users('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'userName TEXT,'
            'email TEXT,'
            'password TEXT'
            ')');
        print('table 1 created');
        db.execute('CREATE TABLE courses('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT,'
            'description TEXT,'
            'coursePeriod INTEGER,'
            'studentsNumber INTEGER,'
            'imgPath TEXT,'
            'userId INTEGER,'
            'FOREIGN KEY (userId) references users(id)'
            ')');
        print('table 2 created');
        db.execute('CREATE TABLE students('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT,'
            'gender TEXT,'
            'age INTEGER,'
            'mobileNumber INTEGER,'
            'email TEXT,'
            'attendenceDays INTEGER,'
            'absentDays INTEGER,'
            'courseId INTEGER,'
            'FOREIGN KEY (courseId) references courses(id)'
            ')');
        print('table 3 created');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        print('onUpgrade is excuted');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        print('onDowngrade is excuted');
      },
      // readOnly: true,
      // singleInstance: true,
    );
  }
}




// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DbController {
//   DbController._();

//   static DbController? _instance;
//   late Database _database;

//   factory DbController() {
//     return _instance ??= DbController._();
//   }

//   Future<void> initDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, 'app_db.sql');

//     print(path);
//   }
// }
