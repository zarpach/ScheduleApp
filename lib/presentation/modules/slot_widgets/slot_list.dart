import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/presentation/modules/slot_widgets/slot_list_item.dart';

import '../lesson_widgets/expand_lesson_container.dart';

class SlotListWidget extends StatelessWidget {
  final List<Map<String, String>> lessons;
  final List<String> lessonTime;
  final double width;
  final double height;

  const SlotListWidget({
    super.key,
    required this.lessons,
    required this.lessonTime,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .outlineVariant
              .withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 6,
            itemBuilder: (itemBuilder, index) {
              return OpenContainer(
                openElevation: 0,
                openColor: Colors.transparent,
                closedColor:
                Theme.of(context)
                    .colorScheme
                    .outlineVariant
                    .withOpacity(0.01),
                closedElevation: 0,
                closedShape: const Border(),
                openShape: const Border(),
                transitionDuration: const Duration(milliseconds: 450),
                transitionType: ContainerTransitionType.fade,
                openBuilder: (context, openContainer) => ExpandLesson(title: 'List Menu Item ${index + 1}'),
                closedBuilder: (context, openContainer) {
                  return ScheduleListItem(
                    lesson: lessons[index],
                    time: lessonTime[index],
                    width: width,
                    height: height,
                    onTap: openContainer,
                  );
                },
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 0,
              indent: width / 3.6,
              endIndent: 0,
            );
          },
          )
      ),
    );
  }
}