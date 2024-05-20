import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'modules/card_tile.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder:
        (BuildContext context, bool innerBoxScrolled) {
          return <Widget> [
            _sliverAppBarTitle(context, height),
          ];
        },
        body: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: const [
            CardTile(),
            CardTile(),
            CardTile(),
            CardTile(),
          ],
        )
      ),
    );
  }
}


SliverAppBar _sliverAppBarTitle(BuildContext context, double height) {
  return SliverAppBar(
    centerTitle: false,
    expandedHeight: height * 0.20,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: const EdgeInsets.symmetric(horizontal: 20.0),
      title: Text(
          'Settings',
          style: GoogleFonts.roboto(
              fontSize: 26,
              color: Theme.of(context).textTheme.titleLarge?.color)
      ),
    ),
  );
}
