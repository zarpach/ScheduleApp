import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class GreetingWidget extends StatelessWidget {
  final Brightness appBrightness;
  final void Function() onTap;
  final String dayOfWeek;

  const GreetingWidget({
    super.key,
    required this.appBrightness,
    required this.onTap,
    required this.dayOfWeek
  });

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String username = user?.displayName?.split(' ')[0] ?? "stranger";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Hi, $username!',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w800,
            letterSpacing: -2,
            fontSize: 48,
          ),
        ),
        const Gap(16),
        JustTheTooltip(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          preferredDirection: AxisDirection.right,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Schedule settings',
              style: TextStyle(
                color: appBrightness == Brightness.dark
                    ? Colors.black87
                    : Colors.white70,
                letterSpacing: -0.2,
              ),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dayOfWeek,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w300,
                    fontSize: 28,
                  ),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
