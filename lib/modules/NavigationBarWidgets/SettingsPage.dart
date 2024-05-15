import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule_app/modules/SettingsListTiles/FeedbackListTile.dart';
import 'package:schedule_app/modules/SettingsListTiles/LanguageListTile.dart';
import 'package:schedule_app/modules/SettingsListTiles/ProfileListTileWidget.dart';
import 'package:schedule_app/modules/SettingsListTiles/ThemeSettingsListTile.dart';

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
            _sliverSearchBar(context, height),
            //const SliverGap(12.0)
          ];
        },
        body: ListView(
          padding: EdgeInsets.zero,
            children: const [
              ProfileListTile(),
              ThemeListTile(),
              LanguageListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
              FeedbackListTile(),
            ]
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

SliverAppBar _sliverSearchBar(BuildContext context, double height) {
  return SliverAppBar(
    expandedHeight: height * 0.1,
    collapsedHeight: height * 0.1,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        color: Theme.of(context).colorScheme.background,
      ),
      titlePadding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 8),
      title: SearchAnchor(
        isFullScreen: true,
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            hintText: 'Search settings',
            hintStyle: MaterialStatePropertyAll(
              TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0
              )
            ),
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.surfaceVariant),
            padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20.0)),
            leading: const Icon(Icons.search),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                },
              );
            }
          );
        },
      ),
    ),
  );
}