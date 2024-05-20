import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleListItem extends StatelessWidget {
  final Map<String, String> lesson;
  final String time;
  final double width;
  final double height;
  final void Function() onTap;

  const ScheduleListItem({
    super.key,
    required this.lesson,
    required this.time,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: width / 3.6,
            height: height / 6 - height * 0.05,
            child: Center(
              child: Text(
                time,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ),
          lesson['second'] == ''
              ? Text(
            lesson['first']!,
            style: GoogleFonts.manrope(
              letterSpacing: -0.3,
            ),
            maxLines: 1,
          )
              : Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  lesson['first']!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                const Gap(4),
                Text(
                  lesson['second']!,
                  maxLines: 1,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
