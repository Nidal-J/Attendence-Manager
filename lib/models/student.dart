enum StudentTableKeys {
  id,
  name,
  gender,
  age,
  mobileNumber,
  email,
  address,
  attendenceDays,
  absentDays,
  courseId,
}

class Student {
  late int id;
  late String name;
  late String gender;
  late int age;
  late String mobileNumber;
  late String email;
  // late String address;
  int attendenceDays = 0;
  int absentDays = 0;
  int courseId = 0;

  static const tableName = 'students';

  Student();

  // To read from db [read map - store object]
  Student.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap[StudentTableKeys.id.name];
    name = rowMap[StudentTableKeys.name.name];
    gender = rowMap[StudentTableKeys.gender.name];
    age = rowMap[StudentTableKeys.age.name];
    mobileNumber = rowMap[StudentTableKeys.mobileNumber.name];
    email = rowMap[StudentTableKeys.email.name];
    // address = rowMap[StudentTableKeys.address.name];
    attendenceDays = rowMap[StudentTableKeys.attendenceDays.name];
    absentDays = rowMap[StudentTableKeys.absentDays.name];
    courseId = rowMap[StudentTableKeys.courseId.name];
  }

  // To write to db [read object - store map]
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map[StudentTableKeys.name.name] = name;
    map[StudentTableKeys.gender.name] = gender;
    map[StudentTableKeys.age.name] = age;
    map[StudentTableKeys.mobileNumber.name] = mobileNumber;
    map[StudentTableKeys.email.name] = email;
    // map[StudentTableKeys.address.name] = address;
    map[StudentTableKeys.attendenceDays.name] = attendenceDays;
    map[StudentTableKeys.absentDays.name] = absentDays;
    map[StudentTableKeys.courseId.name] = courseId;
    return map;
  }
}
