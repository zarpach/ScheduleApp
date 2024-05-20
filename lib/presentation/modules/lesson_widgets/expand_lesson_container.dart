import 'package:flutter/material.dart';

class ExpandLesson extends StatelessWidget {
  const ExpandLesson({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => {
            Navigator.of(context).pop()
          },
          child: const Icon(Icons.close),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const Center(child: Text('CONTENT')),
    );
  }
}