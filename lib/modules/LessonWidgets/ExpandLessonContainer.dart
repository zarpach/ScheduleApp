import 'package:flutter/material.dart';

class ExpandLesson extends StatelessWidget {
  const ExpandLesson({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(child: Text('CONTENT')),
    );
  }
}