import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_app/presentation/auth/signin_google.dart';

import '../data/blocs/auth/auth_blocs.dart';
import '../main.dart';

class ScheduleApp extends StatelessWidget {
  const ScheduleApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUCA Schedule',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Manrope",
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontWeight: FontWeight.normal),
          labelSmall: TextStyle(
              fontWeight: FontWeight.w600, letterSpacing: 0),
          labelLarge: TextStyle(fontWeight: FontWeight.w400),
          labelMedium: TextStyle(fontWeight: FontWeight.w700)
        ),
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.indigo.shade100,
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal
              );
            }
            return const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal
            );
          }
          ),
        ),
      ),

      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.manrope().fontFamily,
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue.shade100,
      ),
      themeMode: ThemeMode.system,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const MyHomePage(title: 'My IUCA',);
          } else {
            return const SigninGoogle();
          }
        },
      ),
    );
  }
}