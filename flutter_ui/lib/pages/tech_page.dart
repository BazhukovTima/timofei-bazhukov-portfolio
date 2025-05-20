// lib/pages/tech_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/web_layout.dart';

class TechPage extends StatelessWidget {
  const TechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebLayout(
      child: Center(
        child: Text("TechPage"),
      ),
    );
  }
}
