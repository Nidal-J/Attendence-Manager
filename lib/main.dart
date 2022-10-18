import 'package:attendance_manager/database/db_controller.dart';
import 'package:attendance_manager/provider/course_provider.dart';
import 'package:attendance_manager/provider/language_provider.dart';
import 'package:attendance_manager/provider/mode_provider.dart';
import 'package:attendance_manager/provider/pick_image_provider.dart';
import 'package:attendance_manager/provider/student_provider.dart';
import 'package:attendance_manager/screens/app/add_edit_student.dart';
import 'package:attendance_manager/screens/app/courses_screen.dart';
import 'package:attendance_manager/screens/app/edit_course.dart';
import 'package:attendance_manager/screens/app/edit_student_data.dart';
import 'package:attendance_manager/screens/app/add_new_course.dart';
import 'package:attendance_manager/screens/app/pick_image.dart';
import 'package:attendance_manager/screens/app/students_screen.dart';
import 'package:attendance_manager/screens/auth/register_screen.dart';
import 'package:attendance_manager/screens/launch_screen.dart';
import 'package:attendance_manager/screens/onboarding/onboarding_screen.dart';
import 'package:attendance_manager/preferences/shared_pref_controller.dart';
// import 'package:attendance_manager/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider()),
        ChangeNotifierProvider<ModeProvider>(
            create: (context) => ModeProvider()),
        ChangeNotifierProvider<CourseProvider>(
            create: (context) => CourseProvider()),
        ChangeNotifierProvider<StudentProvider>(
            create: (context) => StudentProvider()),
        ChangeNotifierProvider<PickImageProvider>(
            create: (context) => PickImageProvider()),
      ],
      builder: (context, widget) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF003865),
          ),
          // textTheme: TextTheme()
        ),
        // themeMode: ThemeMode.light,

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: Locale(context.watch<LanguageProvider>().lang),
        // locale: Locale(Provider.of<ChangeLanguage>(context).lang),

        initialRoute: '/',
        routes: {
          '/': (context) => const LaunchScreen(),
          '/onboarding_screen': (context) => const OnBoardingScreen(),
          '/login_screen': (context) => const LoginScreen(),
          '/register_screen': (context) => const RegisterScreen(),
          // '/test_screen': (context) => const TestScreen(),
          '/add_new_course': (context) => const AddNewCourse(),
          '/edit_course': (context) => const EditCourse(),
          '/pick_image': (context) => const PickImage(),
          '/courses_screen': (context) => const CoursesScreen(),
          '/students_screen': (context) => const StudentsScreen(),
          '/add_edit_student': (context) => const AddEditStudent(),
          '/edit_student_data': (context) => const EditStudentData(),
        },
      ),
    );
  }
}
