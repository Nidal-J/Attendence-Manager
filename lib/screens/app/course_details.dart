import 'package:attendance_manager/models/course.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({required this.course, Key? key}) : super(key: key);
  final Course course;
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '${widget.course.name} course',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(widget.course.imgPath),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'About course:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.course.description,
              style: const TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Course period:  ${widget.course.coursePeriod}  days',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Students number:  ${widget.course.studentsNumber}  students',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/students_screen');
              },
              icon:
                  const Icon(Icons.people_alt_sharp, color: Color(0xFF3CCF4E)),
              label: const Text(
                'Show all students',
                style: TextStyle(
                  color: Color(0xFF003865),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                // textStyle:
                side: const BorderSide(
                  color: Color(0xFFD4F6CC),
                  width: 1.6,
                ),
                backgroundColor: const Color(0xFFD4F6CC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
