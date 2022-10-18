import 'package:attendance_manager/database/controllers/student_controller.dart';
import 'package:attendance_manager/models/process_response.dart';
import 'package:attendance_manager/models/student.dart';
import 'package:flutter/cupertino.dart';

class StudentProvider extends ChangeNotifier {
  List<Student> students = <Student>[];

  StudentController studentController = StudentController();

  Future<ProcessResponse> add({required Student newStudent}) async {
    int newRowId = await studentController.create(newStudent);

    if (newRowId != 0) {
      newStudent.id = newRowId;
      students.add(newStudent);
      notifyListeners();
    }
    String message = newRowId != 0
        ? '${newStudent.name} added successfully.'
        : 'Adding Failed! please try again.';
    return ProcessResponse(message: message, success: newRowId != 0);
  }

  void read() async {
    students = await studentController.read();
    notifyListeners();
  }

  Future<ProcessResponse> update({required Student updatedCourse}) async {
    bool updated = await studentController.update(updatedCourse);

    if (updated) {
      int index =
          students.indexWhere((course) => course.id == updatedCourse.id);
      if (index != -1) {
        students[index] = updatedCourse;
        notifyListeners();
      }
    }
    return ProcessResponse(
        message: updated ? 'Updated successfully.' : 'Updated failed!',
        success: updated);
  }

  Future<bool> delete({required int index}) async {
    bool deleted = await studentController.delete(students[index].id);
    if (deleted) {
      students.removeAt(index);
      notifyListeners();
    }
    return deleted;
  }
}
