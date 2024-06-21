import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/blocs/auth/auth_blocs.dart';
import 'modules/card_tile.dart';
import 'modules/rounded_list_view.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;
  final children = List<Widget>.generate(5, (i) => ListTile(title: Text('$i')));

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<Map<String, dynamic>> preferencesItems = [
      {'title': 'Student info', 'subtitle': 'Departments and groups', 'icon': Icons.school},
      {'title': 'Theme', 'subtitle': 'Colors, dark theme', 'icon': Icons.brightness_medium},
      {'title': 'Language', 'subtitle': 'Kyrgyz, russian and english', 'icon': Icons.language},
      // Add more items here
    ];
    final List<Map<String, dynamic>> contactItems = [
      {'title': 'Send feedback', 'subtitle': 'Share your thoughts', 'icon': Icons.feedback},
      {'title': 'Contact the developer', 'subtitle': "Telegram, WhatsApp or email", 'icon': Icons.contact_support},
      // Add more items here
    ];
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Preferences',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const Gap(12),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: preferencesItems.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      isFirst: index == 0,
                      isLast: index == preferencesItems.length - 1,
                      title: preferencesItems[index]['title'],
                      subtitle: preferencesItems[index]['subtitle'],
                      leadingIcon: preferencesItems[index]['icon'],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 3,
                  )
                ),
                const Gap(18),
                Text(
                  'Contact',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const Gap(12),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: contactItems.length,
                    itemBuilder: (context, index) {
                      return CustomListTile(
                        isFirst: index == 0,
                        isLast: index == contactItems.length - 1,
                        title: contactItems[index]['title'],
                        subtitle: contactItems[index]['subtitle'],
                        leadingIcon: contactItems[index]['icon'],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 3,
                    )
                ),
                OutlinedButton.icon(
                    onPressed: () => {
                      context.read<AuthBloc>().add(SignOut())
                    },
                    label: const SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Log out'),
                            Gap(4),
                            Icon(Icons.logout)
                          ],
                        )
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).colorScheme.error),
                      foregroundColor: Theme.of(context).colorScheme.error
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



SliverAppBar _sliverAppBarTitle(BuildContext context, double height) {
  final User? user = FirebaseAuth.instance.currentUser;
  return SliverAppBar(
    centerTitle: false,
    expandedHeight: height * 0.20,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: const EdgeInsets.symmetric(horizontal: 20.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Profile',
            style: GoogleFonts.roboto(
              fontSize: 26,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          if (user != null && user.photoURL != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 20,
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 20,
                child: Icon(Icons.person),
              ),
            ),
        ],
      ),
    ),
  );
}
