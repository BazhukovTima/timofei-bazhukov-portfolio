import 'package:flutter/material.dart';
import '../navbar/navbar.dart';
import '../footer/footer.dart';

class WebLayout extends StatelessWidget {
  final Widget child;
  final bool showFooter;

  const WebLayout({super.key, required this.child, this.showFooter = true});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    double topInset = MediaQuery.of(context).viewPadding.top;

    if (isMobile) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: topInset),
          child: Column(
            children: [
              Expanded(child: child),
              if (showFooter) const Footer(),
              const Navbar(),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          children: [
            const Navbar(),
            Expanded(child: child),
            if (showFooter) const Footer(),
          ],
        ),
      );
    }
  }
}
