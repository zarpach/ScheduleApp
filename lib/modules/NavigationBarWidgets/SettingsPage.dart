import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverAppBar(
                expandedHeight: 185.0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(bottom: 24.0),
                  title: Text(
                      'Settings',
                      style: GoogleFonts.roboto(
                          fontSize: 26,
                          color: Theme.of(context).textTheme.titleLarge?.color)
                  ),
                ),
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    child: SearchAnchor(
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
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 20.0)),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                          );
                        }, suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    }),
                  ),
                ),
            ),

            const SliverToBoxAdapter(
              child: Gap(16),
            ),
            SliverList.list(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text(
                        'Profile settings',
                        style: GoogleFonts.roboto(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0
                        )
                    ),
                    subtitle: const Text('Field of study, group'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                            builder: (context) {
                              return Scaffold(
                                appBar: AppBar(title: const Text(
                                    'ListTile Hero')),
                                body: Center(
                                  child: Hero(
                                    tag: 'ListTile-Hero',
                                    child: Material(
                                      child: ListTile(
                                        title: const Text('ListTile with Hero'),
                                        subtitle: const Text(
                                            'Tap here to go back'),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  ),
                ]
            )
          ],
        ),
    );
  }
}