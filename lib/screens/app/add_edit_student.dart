import 'package:attendance_manager/models/process_response.dart';
import 'package:attendance_manager/models/student.dart';
import 'package:attendance_manager/provider/student_provider.dart';
import 'package:attendance_manager/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditStudent extends StatefulWidget {
  const AddEditStudent({this.editedStudent, Key? key}) : super(key: key);
  final Student? editedStudent;

  @override
  State<AddEditStudent> createState() => _AddEditStudentState();
}

class _AddEditStudentState extends State<AddEditStudent> with Helpers {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _mobileNumController;
  late TextEditingController _emailController;
  String gender = 'male';
  // Student? student;
  // String

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.editedStudent?.name);
    _ageController =
        TextEditingController(text: widget.editedStudent?.age.toString());
    _mobileNumController =
        TextEditingController(text: widget.editedStudent?.mobileNumber);
    _emailController = TextEditingController(text: widget.editedStudent?.email);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _mobileNumController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ModalRoute? modalRoute = ModalRoute.of(context);
    // if (modalRoute != null) {
    //   student = modalRoute.settings.arguments as Student?;
    // }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(isNewStudent ? 'Add student' : 'Edit student'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isNewStudent ? 'Add new student' : 'Edit student data',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required *';
                  }
                  return null;
                },
                controller: _nameController,
                maxLength: 30,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: 'student name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                      width: 1.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'This field is required *';
                        }
                        return null;
                      },
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'age',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFFDDDDDD),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Color(0xFFDDDDDD),
                            width: 1.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: RadioListTile(
                          // contentPadding: EdgeInsets.zero,
                          title: const Text('male'),
                          value: 'male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: RadioListTile(
                          title: const Text('female'),
                          value: 'female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
                controller: _mobileNumController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'mobile num.',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
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
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'email',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                      width: 1.6,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _performSave();
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

  bool get isNewStudent => widget.editedStudent == null;

  Future<void> _performSave() async {
    ProcessResponse response = isNewStudent
        ? await Provider.of<StudentProvider>(context, listen: false)
            .add(newStudent: student)
        : await Provider.of<StudentProvider>(context, listen: false)
            .update(updatedCourse: student);

    if (!mounted) return;
    showSnackBar(context, message: response.message, success: response.success);

    if (response.success) Navigator.pop(context);
  }

  Student get student {
    Student newStudent = isNewStudent ? Student() : widget.editedStudent!;
    newStudent.name = _nameController.text;
    newStudent.age = int.parse(_ageController.text);
    newStudent.gender = gender;
    newStudent.mobileNumber = _mobileNumController.text;
    newStudent.email = _emailController.text;

    return newStudent;
  }
}
