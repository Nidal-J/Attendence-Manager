import 'package:attendance_manager/models/course.dart';
import 'package:attendance_manager/models/process_response.dart';
import 'package:attendance_manager/provider/course_provider.dart';
import 'package:attendance_manager/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCourse extends StatefulWidget {
  const EditCourse({this.course, Key? key}) : super(key: key);
  final Course? course;

  @override
  State<EditCourse> createState() => _EditCourseState();
}

class _EditCourseState extends State<EditCourse> with Helpers {
  late TextEditingController _courseNameController;
  late TextEditingController _coursePeriodController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _courseNameController = TextEditingController(text: widget.course!.name);
    _coursePeriodController =
        TextEditingController(text: widget.course!.coursePeriod.toString());
    super.initState();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _coursePeriodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Course data'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required *';
                  }
                  return null;
                },
                controller: _courseNameController,
                maxLength: 30,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: 'course name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFEF5B0C),
                      width: 1.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required *';
                  }
                  return null;
                },
                controller: _coursePeriodController,
                keyboardType: TextInputType.number,
                // textInputAction: TextInputAction.go,
                // maxLength: 30,
                decoration: InputDecoration(
                  // counterText: '',
                  labelText: 'number of days',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFEF5B0C),
                      width: 1.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _performSave();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFEF5B0C),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performSave() async {
    ProcessResponse response =
        await Provider.of<CourseProvider>(context, listen: false)
            .update(updatedCourse: course);
    if (!mounted) return;
    showSnackBar(context, message: response.message);
    if (response.success) Navigator.pop(context);
  }

  Course get course {
    Course updatedCourse = widget.course ?? Course();
    updatedCourse.name = _courseNameController.text;
    updatedCourse.coursePeriod = int.parse(_coursePeriodController.text);

    return updatedCourse;
  }
}
