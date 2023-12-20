import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeNavState();
}

class _HomeNavState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                    // Current weekday, using 'EEEE' format of current date
                    Text(
                        DateFormat('EEEE').format(DateTime.now()),
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w300,
                          fontSize: 28
                        ),
                    ),

                  ],
                ),
              ),
              const Gap(20),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.down,
                    itemCount: 6,
                      itemBuilder: (itemBuilder, index) {
                        return ExpansionTile(
                          shape: const Border(),

                          title: Text('ExpansionTile $index'),
                          subtitle: const Text('Trailing expansion arrow icon'),
                          children: <Widget>[
                            ListTile(title: Text('This is tile number $index')),
                          ],
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 2,
                          indent: width / 4,
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