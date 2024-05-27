import 'package:animations/animations.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:schedule_app/presentation/modules/slot_widgets/slot_list_item.dart';

import '../../../data/blocs/app/app_blocs.dart';
import '../../../data/blocs/app/app_events.dart';
import '../../../data/blocs/app/app_states.dart';
import '../../../domain/model/slot.dart';
import '../lesson_widgets/expand_lesson_container.dart';

class SlotListWidget extends StatelessWidget {
  final List<String> lessonTime;
  final double width;
  final double height;

  const SlotListWidget({
    super.key,
    required this.lessonTime,
    required this.width,
    required this.height,
  });
  //
  // Future<Map<String, dynamic>> getStoredOptions() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final departmentId = prefs.getInt('departmentId');
  //   final groupId = prefs.getInt('groupId');
  //   final dayOfWeek = prefs.getInt('dayOfWeek');
  //   return {
  //     'departmentId': departmentId,
  //     'groupId': groupId,
  //     'dayOfWeek': dayOfWeek,
  //   };
  // }



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<SlotBloc, SlotState>(
          builder: (context, state) {
            if (state is SlotLoadingState) {
              return const Center(
                child: CircularProgressIndicator(strokeCap: StrokeCap.round),
              );
            }

            if (state is SlotErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text("Couldn't load the schedule")),
                  TextButton(
                      onPressed: () async {
                        context.read<SlotBloc>().add(LoadSlotEvent());
                        },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.refresh_rounded),
                          Gap(4),
                          Text('Try again'),
                        ],
                      ))
                ],
              );
            }

            if (state is SlotLoadedState) {
              List<Slot> slots = state.slots;
              return CustomMaterialIndicator(
                onRefresh: () async {
                  context.read<SlotBloc>().add(LoadSlotEvent());
                },
                indicatorBuilder: (BuildContext context, IndicatorController controller) {
                  return Icon(
                    color: Theme.of(context).colorScheme.primary,
                    Icons.school_rounded,
                    size: 26,
                  );
                },
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: lessonTime.length,
                  itemBuilder: (context, index) {
                      return OpenContainer(
                        openElevation: 0,
                        openColor: Colors.transparent,
                        closedColor: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.01),
                        closedElevation: 0,
                        closedShape: const Border(),
                        openShape: const Border(),
                        transitionDuration: const Duration(milliseconds: 450),
                        transitionType: ContainerTransitionType.fade,
                        openBuilder: (context, openContainer) => ExpandLesson(title: 'List Menu Item ${index + 1}'),
                        closedBuilder: (context, openContainer) {
                          Slot? slot = slots.firstWhereOrNull(
                                  (element) => element.lessonPeriod.name == lessonTime[index]);
                          return ScheduleListItem(
                            slot: slot,
                            time: lessonTime[index],
                            width: width,
                            height: height,
                            onTap: openContainer,
                            isSlotNull: slot == null,
                          );
                        },
                      );

                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 0,
                      indent: width / 3.6,
                      endIndent: 0,
                    );
                  },
                ),
              );
            }
            return const Center(child: Text("An error occurred while loading the schedule"));
          },
        ),
      ),
    );
  }
}
