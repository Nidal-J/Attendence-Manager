import 'package:attendance_manager/database/controllers/course_controller.dart';
import 'package:attendance_manager/models/course.dart';
import 'package:attendance_manager/models/process_response.dart';
import 'package:flutter/cupertino.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> courses = <Course>[];

  CourseController courseController = CourseController();

  Future<ProcessResponse> create({required Course newCourse}) async {
    int newRowId = await courseController.create(newCourse);

    if (newRowId != 0) {
      newCourse.id = newRowId;
      courses.add(newCourse);
      notifyListeners();
    }
    String message = newRowId != 0
        ? '${newCourse.name} course created successfully.'
        : 'Creating Failed! please try again.';
    return ProcessResponse(message: message, success: newRowId != 0);
  }

  void read() async {
    courses = await courseController.read();
    notifyListeners();
  }

  Future<ProcessResponse> update({required Course updatedCourse}) async {
    bool updated = await courseController.update(updatedCourse);

    if (updated) {
      int index = courses.indexWhere((course) => course.id == updatedCourse.id);
      if (index != -1) {
        courses[index] = updatedCourse;
        notifyListeners();
      }
    }
    return ProcessResponse(
        message: updated ? 'Updated successfully.' : 'Updated failed!',
        success: updated);
  }

  Future<bool> delete({required int index}) async {
    bool deleted = await courseController.delete(courses[index].id);
    if (deleted) {
      courses.removeAt(index);
      notifyListeners();
    }
    return deleted;
  }
}
