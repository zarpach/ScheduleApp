import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/presentation/modules/slot_widgets/slot_list_item.dart';

import '../../../data/bloc/slot_repository.dart';
import '../../../data/blocs/app_blocs.dart';
import '../../../data/blocs/app_events.dart';
import '../../../data/blocs/app_states.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SlotBloc(
        SlotRepository(),
      )..add(LoadSlotEvent()),

      child: BlocBuilder<SlotBloc, SlotState>(
          builder: (context, state) {
            if (state is SlotLoadingState) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator.adaptive(strokeCap: StrokeCap.round,),
                ),
              );
            }

            if (state is SlotErrorState) {
              return const Expanded(child: Center(child: Text("Error while loading the slots")));
            }

            if (state is SlotLoadedState) {
              List<Slot> slots = state.slots;
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
                              slot: slots[index],
                              time: lessonTime[index],
                              width: width,
                              height: height,
                              onTap: openContainer,
                              isSlotNull: slots[index].lessonPeriod.name != lessonTime[index],
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
            return Container();
          }
      ),
    );
  }
}