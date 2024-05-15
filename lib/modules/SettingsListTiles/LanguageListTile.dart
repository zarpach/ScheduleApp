import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageListTile extends StatelessWidget {
  const LanguageListTile({super.key});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
      leading: const Icon(Icons.language_outlined),
      title: Text(
          'Language',
          style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              letterSpacing: 0
          )
      ),
      subtitle: const Text('Russian and English'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Widget>(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(),
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