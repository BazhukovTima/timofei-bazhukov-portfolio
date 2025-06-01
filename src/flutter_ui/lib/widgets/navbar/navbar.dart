import 'package:flutter/material.dart';
import 'top_navbar.dart';
import 'bottom_navbar.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return const BottomNavbar();
    } else {
      return const TopNavbar();
    }
  }
}
