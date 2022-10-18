import 'package:attendance_manager/widgets/onboarding_widget.dart';
import 'package:attendance_manager/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 60),
        child: Column(
          children: [
            Visibility(
              visible: _currentIndex != 2,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: const Text(
                    'skip',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                controller: _pageController,
                children: const [
                  OnBoarding1(
                    image: 'assets/images/onboarding1.png',
                    title: 'Welcaome',
                    subTitle:
                        'Welcome to Attendence Manager App, It please us to have you on it. You can browse it for free!',
                  ),
                  OnBoarding1(
                    image: 'assets/images/onboarding2.png',
                    title: 'App Advantages',
                    subTitle:
                        'Welcome to Attendence Manager App, It please us to have you on it. You can browse it for free!',
                  ),
                  OnBoarding1(
                    image: 'assets/images/onboarding3.png',
                    title: 'Start now.',
                    subTitle:
                        'Welcome to Attendence Manager App, It please us to have you on it. You can browse it for free!',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageIndicator(
                  color: _currentIndex == 0
                      ? const Color(0xFF003865)
                      : Colors.grey,
                  width: _currentIndex == 0 ? 20 : 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                PageIndicator(
                  color: _currentIndex == 1
                      ? const Color(0xFF003865)
                      : Colors.grey,
                  width: _currentIndex == 1 ? 20 : 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                PageIndicator(
                  color: _currentIndex == 2
                      ? const Color(0xFF003865)
                      : Colors.grey,
                  width: _currentIndex == 2 ? 20 : 10,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _currentIndex == 2,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF003865),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Start now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
