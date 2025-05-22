import 'package:flutter/material.dart';
import 'web_navbar.dart';
import 'footer.dart';

class WebLayout extends StatelessWidget {
  final Widget child;
  final bool showFooter;

  const WebLayout({
    super.key,
    required this.child,
    this.showFooter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WebNavbar(),
          Expanded(
            child: child,
          ),
          if (showFooter) const Footer(),
        ],
      ),
    );
  }
}
