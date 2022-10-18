import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:attendance_manager/provider/course_provider.dart';
import 'package:attendance_manager/provider/language_provider.dart';
import 'package:attendance_manager/provider/mode_provider.dart';
import 'package:attendance_manager/widgets/course_card.dart';
import 'package:attendance_manager/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(SharedPrefController()
                  .getValueFor(key: PrefKeys.userName.name)),
              accountEmail: Text(
                  SharedPrefController().getValueFor(key: PrefKeys.email.name)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/male_avatar.png'),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF003865),
              ),
              margin: const EdgeInsets.all(0),
            ),
            ExpansionTile(
              backgroundColor: const Color(0xFFEEEEEE),
              childrenPadding: const EdgeInsets.all(0),
              leading: const Icon(Icons.settings_brightness),
              title: const Text('Mode'),
              children: [
                RadioListTile(
                  visualDensity: VisualDensity.compact,
                  title: const Text('Light'),
                  secondary: const Icon(Icons.light_mode),
                  value: 'light',
                  groupValue: Provider.of<ModeProvider>(context).mode,
                  onChanged: (value) {
                    Provider.of<ModeProvider>(context, listen: false)
                        .changeMode(value.toString());
                  },
                ),
                RadioListTile(
                  visualDensity: VisualDensity.compact,
                  title: const Text('Dark'),
                  secondary: const Icon(Icons.dark_mode),
                  value: 'dark',
                  groupValue: Provider.of<ModeProvider>(context).mode,
                  onChanged: (value) {
                    Provider.of<ModeProvider>(context, listen: false)
                        .changeMode(value.toString());
                  },
                ),
              ],
            ),
            ExpansionTile(
              backgroundColor: const Color(0xFFEEEEEE),
              childrenPadding: const EdgeInsets.all(0),
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              children: [
                RadioListTile(
                  visualDensity: VisualDensity.compact,
                  title: const Text('English Language'),
                  // secondary: const Icon(Icons.engli),
                  value: 'en',
                  groupValue: Provider.of<LanguageProvider>(context).lang,
                  onChanged: (value) {
                    Provider.of<LanguageProvider>(context, listen: false)
                        .changeLang(value.toString());
                    // setState(() {
                    //   lang = value.toString();
                    // });
                  },
                ),
                RadioListTile(
                  visualDensity: VisualDensity.compact,
                  title: const Text('اللغة العربية'),
                  // secondary: const Icon(Icons.dark_mode),
                  value: 'ar',
                  groupValue: Provider.of<LanguageProvider>(context).lang,
                  onChanged: (value) {
                    Provider.of<LanguageProvider>(context, listen: false)
                        .changeLang(value.toString());
                  },
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                // print(await SharedPrefController().clear());
              },
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ),
            InkWell(
              onTap: () async {
                await _logOut(context);
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_new_course');
        },
        backgroundColor: const Color(0xFF003865),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Courses'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, child) {
          if (courseProvider.courses.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courseProvider.courses.length,
              itemBuilder: (context, index) => CourseCard(
                index: index,
                courseProvider: courseProvider,
              ),
            );
          } else {
            return const NoData();
          }
        },
      ),
    );
  }

  Future<void> _logOut(BuildContext context) async {
    // avoid BuildContext in asynchronous gaps

    // SOLUTION #1  -  Statefulwidget only
    // bool cleared = await SharedPrefController().clear();
    // if (cleared) {
    //   if (!mounted) return;
    //   Navigator.of(context).pushNamedAndRemoveUntil(
    //       '/  login_screen', (route) => route.settings.name == '/login_screen');
    // }

    // SOLUTION #2
    var navigate = Navigator.of(context);
    bool cleared = await SharedPrefController().clear();

    if (cleared) {
      navigate.pushNamedAndRemoveUntil(
          '/login_screen', (route) => route.settings.name == '/login_screen');
    }
  }
}
