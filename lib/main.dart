import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_app/modules/NavigationBarWidgets/SettingsPage.dart';
import 'package:schedule_app/modules/NavigationBarWidgets/home.dart';
import 'package:schedule_app/modules/NavigationBarWidgets/transcriptPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUCA Schedule',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.lightGreen.shade500,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.lightGreen.shade400,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Schedule app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Brightness appBrightness = Theme.of(context).brightness;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // status bar
        statusBarColor: Colors.transparent,
        statusBarBrightness: appBrightness,
        statusBarIconBrightness:
        appBrightness == Brightness.dark ? Brightness.light : Brightness.dark,

        // system navigation bar
        // Setting a transparent navigation bar color
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
      ),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 90,
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
              selectedIcon: Icon(Icons.text_increase),
              icon: Icon(Icons.text_increase_rounded),
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
