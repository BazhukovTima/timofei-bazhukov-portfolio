import 'package:flutter/material.dart';

class ExperiencePageContent extends StatelessWidget {
  const ExperiencePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Experience Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
