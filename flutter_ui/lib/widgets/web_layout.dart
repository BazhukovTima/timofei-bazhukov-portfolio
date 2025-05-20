import 'package:flutter/material.dart';
import 'web_navbar.dart';

class WebLayout extends StatelessWidget {
  final Widget child;

  const WebLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WebNavbar(), // всегда сверху
        Expanded(child: child), // контент страницы
      ],
    );
  }
}
