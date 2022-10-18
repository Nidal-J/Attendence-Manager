import 'package:attendance_manager/provider/course_provider.dart';
import 'package:attendance_manager/screens/app/course_details.dart';
import 'package:attendance_manager/screens/app/edit_course.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    required this.index,
    required this.courseProvider,
    Key? key,
  }) : super(key: key);
  final int index;
  final CourseProvider courseProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            courseProvider.courses[index].imgPath,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseProvider.courses[index].name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                  'course period: ${courseProvider.courses[index].coursePeriod} days'),
              Text(
                  'students num: ${courseProvider.courses[index].studentsNumber} students'),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    color: const Color(0xFF3CCF4E),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditCourse(course: courseProvider.courses[index]),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                  IconButton(
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Card(
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Confirm Deletion'),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      // mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Provider.of<CourseProvider>(context,
                                                    listen: false)
                                                .delete(index: index);
                                          },
                                          child: const Text('ok'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetails(
                        course: courseProvider.courses[index],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFEF5B0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Details'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
