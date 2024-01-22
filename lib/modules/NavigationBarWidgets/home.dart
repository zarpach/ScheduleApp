import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:schedule_app/modules/LessonWidgets/ExpandLessonContainer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeNavState();
}

class _HomeNavState extends State<Home> {
  List<String> lessonTime = [
    '8:00 — 9:20',
    '9:30 — 10:50',
    '11:05 — 12:25',
    '12:55 — 14:15',
    '14:30 — 15:50',
    '16:05 — 17:25',
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
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // SizedBox will take 1/3 (approximately) of the device area
                height: height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Greeting text, includes user's name
                    Text(
                        'Hi, Eraaly!',
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -2,
                          fontSize: 48
                        )),
                    const Gap(16),
                    JustTheTooltip(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      preferredDirection: AxisDirection.right,
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Schedule settings',
                          style: TextStyle(
                            color: appBrightness == Brightness.dark ? Colors.black87 : Colors.white70,
                          ),
                        ),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => {},
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat('EEEE').format(DateTime.now()), // Current weekday, using 'EEEE' format of current date
                                style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down)
                            ]
                        ),
                      ),
                    )


                  ],
                ),
              ),
              const Gap(20),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (itemBuilder, index) {
                            return OpenContainer(
                              openElevation: 0,
                              openColor: Colors.transparent,
                              closedColor: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.01),
                              closedElevation: 0,
                              closedShape: const Border(),
                              openShape: const Border(),
                              transitionDuration: const Duration(milliseconds: 600),
                              transitionType: ContainerTransitionType.fade,
                              openBuilder: (context, openContainer) => ExpandLesson(title: 'List Menu Item ${index + 1}'),
                              closedBuilder: (context, openContainer) {
                                return InkWell(
                                  onLongPress: () => {},
                                  onTap: openContainer,
                                  child: Row(
                                        children: [
                                          SizedBox(
                                            width: width / 3.8,
                                            height: height * (0.5362) / 6,
                                            child: Center(
                                                child: Text(
                                                    lessonTime[index],
                                                    style: GoogleFonts.manrope(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      letterSpacing: -0.3
                                                    )
                                                )
                                            ),
                                          ),
                                          Expanded(
                                            child: lessons[index]['second'] == '' ?
                                            Text(
                                                lessons[index]['first']!,
                                                style: GoogleFonts.manrope(
                                                  letterSpacing: -0.3,
                                                ),
                                            )
                                                :
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    lessons[index]['first']!,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: GoogleFonts.manrope(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                      letterSpacing: -0.3
                                                    ),),
                                                  const Gap(4),
                                                  Text(
                                                    lessons[index]['second']!,
                                                    maxLines: 1,
                                                    style: GoogleFonts.manrope(
                                                      fontWeight: FontWeight.w400,
                                                      letterSpacing: -0.3
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ),
                                        ],
                                      ),
                                );
                              },
                            );
                          }, separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 0,
                            indent: width / 3.8,
                            endIndent: 0,
                          );
                        },
                        )
                    ),
                ),

            ],
          ),
      )
    );
  }

}