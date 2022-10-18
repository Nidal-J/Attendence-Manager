import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        String route = SharedPrefController()
                    .getValueFor<bool>(key: PrefKeys.loggedIn.name) ??
                false
            ? '/courses_screen'
            : '/onboarding_screen';
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFF003865),
              Color(0xFF004444),
            ],
          ),
        ),
        child: Column(
          children: const [
            Spacer(),
            SizedBox(
              height: 16,
            ),
            Text(
              'Attendance Manager',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Color(0xFFEF5B0C),
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              '2022© Nidal J. Alraey',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
