import 'package:flutter/material.dart';

class AboutPageContent extends StatelessWidget {
  const AboutPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
