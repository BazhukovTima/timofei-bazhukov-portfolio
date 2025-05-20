import 'package:flutter/material.dart';
import '../widgets/web_layout.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebLayout(
      child: Center(
        child: Text("AboutPage"),
      ),
    );
  }
}
