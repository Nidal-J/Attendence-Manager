enum UserTableKeys { id, userName, email, password }

class User {
  int id = 0;
  late String userName;
  late String email;
  late String password;

  static const tableName = 'users';

  User();

  // To read from db [read map - store object]
  User.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap[UserTableKeys.id.name];
    userName = rowMap[UserTableKeys.userName.name];
    email = rowMap[UserTableKeys.email.name];
    password = rowMap[UserTableKeys.password.name];
  }

  // To write to db [read object - store map]
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map[UserTableKeys.userName.name] = userName;
    map[UserTableKeys.email.name] = email;
    map[UserTableKeys.password.name] = password;
    return map;
  }
}
