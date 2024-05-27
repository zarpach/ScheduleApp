import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/data/bloc/search_repository.dart';
import 'package:schedule_app/data/bloc/slot_repository.dart';
import 'package:schedule_app/data/blocs/app/app_blocs.dart';
import 'package:schedule_app/data/blocs/search/search_blocs.dart';
import 'package:schedule_app/data/blocs/search/search_events.dart';
import 'package:schedule_app/presentation/home_page.dart';
import 'package:schedule_app/presentation/settings_page.dart';
import 'package:schedule_app/presentation/transcript_page.dart';
import 'data/bloc/auth_repository.dart';
import 'data/blocs/app/app_events.dart';
import 'data/blocs/auth/auth_blocs.dart';
import 'data/local_storage_service.dart';
import 'firebase_options.dart';
import 'internal/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authRepository = AuthRepository();
  final slotRepository = SlotRepository();
  final searchRepository = SearchRepository();
  final localStorageService = LocalStorageService();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository, localStorageService)
            ..add(CheckLoginStatus()),
        ),
        BlocProvider(
          create: (context) => SlotBloc(slotRepository)
            ..add(LoadSlotEvent()
          ),
        ),
        BlocProvider(create: (context) => SearchBloc(searchRepository)
        ..add(FetchSlotSearchParametersEvent()))
      ],
      child: const ScheduleApp()
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  late Image myImage;

  @override
  void initState() {
    super.initState();
    myImage = Image.asset('assets/images/backgroundSignin.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }

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
