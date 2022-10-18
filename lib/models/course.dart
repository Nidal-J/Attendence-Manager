enum CourseTableKeys {
  id,
  name,
  description,
  coursePeriod,
  studentsNumber,
  imgPath,
  userId,
}

class Course {
  int id = 0;
  late String name;
  late String description = '';
  late int coursePeriod;
  late int studentsNumber = 0;
  late String imgPath = 'assets/images/Edit-Document-icon.png';
  late int userId;

  static const tableName = 'courses';

  Course();

  // To read from db [read map - store object]
  Course.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap[CourseTableKeys.id.name];
    name = rowMap[CourseTableKeys.name.name];
    description = rowMap[CourseTableKeys.description.name];
    coursePeriod = rowMap[CourseTableKeys.coursePeriod.name];
    studentsNumber = rowMap[CourseTableKeys.studentsNumber.name];
    imgPath = rowMap[CourseTableKeys.imgPath.name];
    userId = rowMap[CourseTableKeys.userId.name];
  }

  // To write to db [read object - store map]
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map[CourseTableKeys.name.name] = name;
    map[CourseTableKeys.description.name] = description;
    map[CourseTableKeys.coursePeriod.name] = coursePeriod;
    map[CourseTableKeys.studentsNumber.name] = studentsNumber;
    map[CourseTableKeys.imgPath.name] = imgPath;
    map[CourseTableKeys.userId.name] = userId;
    return map;
  }
}
