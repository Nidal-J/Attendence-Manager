import 'package:attendance_manager/provider/student_provider.dart';
import 'package:attendance_manager/screens/app/add_edit_student.dart';
import 'package:attendance_manager/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_edit_student');
        },
        backgroundColor: const Color(0xFF003865),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Consumer<StudentProvider>(
        builder: (context, studentProvider, child) =>
            studentProvider.students.isNotEmpty
                ? ListView.builder(
                    itemCount: studentProvider.students.length,
                    itemBuilder: (context, index) => StudentCard(
                      index: index,
                      studentProvider: studentProvider,
                    ),
                  )
                : const NoData(),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  const StudentCard({
    required this.index,
    required this.studentProvider,
    Key? key,
  }) : super(key: key);
  final int index;
  final StudentProvider studentProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: studentProvider.students[index].gender == 'male'
            ? const Color(0xFFE8F9FD)
            : const Color(0xFFFDDDFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
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
                                                Provider.of<StudentProvider>(
                                                        context,
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
                        padding: const EdgeInsets.all(0),
                        alignment: AlignmentDirectional.centerStart,
                        color: Colors.red,
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        alignment: AlignmentDirectional.centerStart,
                        color: const Color(0xFF3CCF4E),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditStudent(
                                  editedStudent:
                                      studentProvider.students[index]),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Student\'s attendence rate 24%'),
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 16),
                    child: SizedBox(
                      height: 5,
                      width: 150,
                      child: LinearProgressIndicator(
                        value: 0.24,
                        backgroundColor: Color(0xFFBBBBBB),
                        color: Color(0xFF003865),
                        // valueColor: Color(0xFF003865),
                      ),
                    ),
                  ),
                  const Text('Attendence days count'),
                  RichText(
                    text: const TextSpan(
                      text: '50/',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: '12',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/${studentProvider.students[index].gender}_avatar.png'),
                  ),
                  const SizedBox(height: 10),
                  Text(studentProvider.students[index].name),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF003865),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    child: const Text('Record attendence'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFEF5B0C),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    child: const Text('undo'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
