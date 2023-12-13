import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeNavState();
}

class _HomeNavState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 255,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    'Hi, Eraaly!',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -2,
                      fontSize: 48
                    )),
                const Gap(16),
                Text(
                    'Monday',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w300,
                      fontSize: 28
                    ),
                )
              ],
            ),
          ),
      )
    );
  }

}