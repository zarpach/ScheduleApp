import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_app/presentation/home_page.dart';
import 'package:schedule_app/presentation/settings_page.dart';
import 'package:schedule_app/presentation/transcript_page.dart';
import 'internal/application.dart';

void main() {
  runApp(const ScheduleApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        noAppBar: true,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 80,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Schedule',
              tooltip: 'Schedule',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.text_increase_rounded),
              icon: Icon(Icons.text_increase_outlined),
              label: 'Transcript',
              tooltip: 'Transcript',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              tooltip: 'Settings',
            ),
          ],
        ),
        body: <Widget>[
          const Home(),
          const TranscriptPage(),
          const SettingsPage(),
        ][currentPageIndex],
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
