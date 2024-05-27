import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/presentation/modules/greeting_widget/greeting_widget.dart';
import 'package:schedule_app/presentation/modules/slot_widgets/slot_list.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../data/blocs/app/app_blocs.dart';
import '../data/blocs/app/app_events.dart';
import 'modules/modal_sheets/schedule_settings_modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeNavState();
}

class _HomeNavState extends State<Home> {
  List<String> lessonTime = [
    '08:00 – 09:20',
    '09:30 – 10:50',
    '11:05 – 12:25',
    '12:55 – 14:15',
    '14:30 – 15:50',
    '16:05 – 17:25',
  ];


  List<Map<String, String>> lessons = [
    {'first': 'Kyrgyz Language and Literature', 'second': 'Sharshenbek u.'},
    {'first': 'Algebra and Geometry', 'second': 'R.A. Asanov'},
    {'first': 'Introduction to IT', 'second': 'A.Zh. Ashimova'},
    {'first': 'Introduction to Computers', 'second': 'A.Zh. Ashimova'},
    {'first': 'Introduction to object-oriented programming I', 'second': 'Sharshenbek u.'},
    {'first': 'Get rest...', 'second': ''},
  ];


  @override
  Widget build(BuildContext context) {
    Brightness appBrightness = Theme.of(context).brightness;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // SizedBox will take 1/3 (approximately) of the device area
            height: height * 0.3,
            child: GreetingWidget(
              appBrightness: appBrightness,
              dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
              onTap: () =>   WoltModalSheet.show(
                  useSafeArea: true,
                  context: context,
                  pageListBuilder: (modalSheetContext) {
                    return [
                      WoltModalSheetPage(
                        scrollController: ScrollController(),
                        navBarHeight: 32,
                        child: const ScheduleModalContent(),

                        // pageTitle: const Center(
                        //     child:
                        //   ),
                        stickyActionBar: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Center(child: Text('Cancel')),
                                ),
                              ),

                              FilledButton(
                                onPressed: () => {
                                  context.read<SlotBloc>().add(LoadSlotEvent()),
                                  Navigator.of(context).pop(),
                                },
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Center(child: Text('Save')),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Other properties...
                      )
                    ];
                  }
              ),
            ),
          ),
          const Gap(16),
          SlotListWidget(
              lessonTime: lessonTime,
              width: width,
              height: height
          )
        ],
      ),
    );
  }
}
