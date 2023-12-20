import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
      leading: const Icon(Icons.account_circle_outlined),
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
              },
          ),
        );
      },
    );
  }
}