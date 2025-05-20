import 'package:flutter/material.dart';

class TechPageContent extends StatelessWidget {
  const TechPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Technologies Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
