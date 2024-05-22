import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/data/blocs/app_blocs.dart';
import 'package:schedule_app/presentation/modules/greeting_widget/greeting_widget.dart';
import 'package:schedule_app/presentation/modules/slot_widgets/slot_list.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'modules/modal_sheets/schedule_settings_modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeNavState();
}

class _HomeNavState extends State<Home> {
  List<String> lessonTime = [
    '08:00 — 9:20',
    '09:30 — 10:50',
    '11:05 — 12:25',
    '12:55 — 14:15',
    '14:30 — 15:50',
    '16:05 — 17:25',
  ];

  List<Map<int, String>> days = [
    {1: 'Monday'},
    {2: 'Tuesday'},
    {3: 'Wednesday'},
    {4: 'Thursday'},
    {5: 'Friday'},
    {6: 'Saturday'},
  ];

  List<Map<String, String>> lessons = [
    {'first': 'Kyrgyz Language and Literature', 'second': 'Sharshenbek u.'},
    {'first': 'Algebra and Geometry', 'second': 'R.A. Asanov'},
    {'first': 'Introduction to IT', 'second': 'A.Zh. Ashimova'},
    {'first': 'Introduction to Computers', 'second': 'A.Zh. Ashimova'},
    {'first': 'Introduction to object-oriented programming I', 'second': 'Sharshenbek u.'},
    {'first': 'Get rest...', 'second': ''},
  ];

  int? selectedDayIndex;
  String? selectedDepartment;
  String? selectedGroup;

  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
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
              username: 'Eraaly',
              appBrightness: appBrightness,
              onTap: () => showScheduleViewModal(context, options, days),
              dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
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

void showScheduleViewModal(BuildContext context, List<S2Choice<String>> options, List<Map<int, String>> days) {
  WoltModalSheet.show(
      useSafeArea: true,
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [
          WoltModalSheetPage(
            navBarHeight: 32,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                return ScheduleModalContent(
                    options: options,
                    days: days);
              },
            ),
            pageTitle: const Center(child: Text('Schedule view')),
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
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
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
  );
}