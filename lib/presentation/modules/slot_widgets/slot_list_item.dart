import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/model/slot.dart';

class ScheduleListItem extends StatelessWidget {
  final Slot slot;
  final String time;
  final double width;
  final double height;
  final void Function() onTap;
  final bool isSlotNull;

  const ScheduleListItem({
    super.key,
    required this.slot,
    required this.time,
    required this.width,
    required this.height,
    required this.onTap,
    required this.isSlotNull
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => {},
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
          isSlotNull
              ? Text(
            'Get rest...',
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
                  slot.announcementSection.announcement.course.nameEng,
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
                  slot.lessonRoom.roomName,
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
