import 'package:attendance_manager/models/course.dart';
import 'package:attendance_manager/models/process_response.dart';
import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:attendance_manager/provider/course_provider.dart';
import 'package:attendance_manager/provider/pick_image_provider.dart';
import 'package:attendance_manager/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({Key? key}) : super(key: key);

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> with Helpers {
  late TextEditingController _courseNameController;
  late TextEditingController _courseDescriptionController;
  late TextEditingController _coursePeriodController;
  late TextEditingController _studentsNumberController;
  final _formKey = GlobalKey<FormState>();
  // final Database _database = DbController().database;

  @override
  void initState() {
    _courseNameController = TextEditingController();
    _courseDescriptionController = TextEditingController();
    _coursePeriodController = TextEditingController();
    _studentsNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _courseDescriptionController.dispose();
    _coursePeriodController.dispose();
    _studentsNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add New Course'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 60,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/pick_image');
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFFD4F6CC),
                    backgroundImage: AssetImage(
                        Provider.of<PickImageProvider>(context).imgPath),
                    // child: const Icon(
                    //   Icons.camera_alt_outlined,
                    //   size: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'course name',
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
                  controller: _courseDescriptionController,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'course description',
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
                    hintText: 'number of days',
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required *';
                    }
                    return null;
                  },
                  controller: _studentsNumberController,

                  keyboardType: TextInputType.number,
                  // textInputAction: TextInputAction.go,
                  // maxLength: 30,
                  decoration: InputDecoration(
                    // counterText: '',
                    hintText: 'number of students',
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
      ),
    );
  }

  Future<void> _performSave() async {
    ProcessResponse response =
        await Provider.of<CourseProvider>(context, listen: false)
            .create(newCourse: course);

    if (!mounted) return;

    showSnackBar(context, message: response.message, success: response.success);

    Provider.of<PickImageProvider>(context, listen: false)
        .changeImage('assets/images/courses_icon.png');

    if (response.success) Navigator.pop(context);
  }

  Course get course {
    Course newCourse = Course();
    newCourse.name = _courseNameController.text;
    newCourse.description = _courseDescriptionController.text;
    newCourse.coursePeriod = int.parse(_coursePeriodController.text);
    newCourse.studentsNumber = int.parse(_studentsNumberController.text);
    newCourse.imgPath =
        Provider.of<PickImageProvider>(context, listen: false).imgPath;
    newCourse.userId =
        SharedPrefController().getValueFor(key: PrefKeys.id.name);

    return newCourse;
  }
}
