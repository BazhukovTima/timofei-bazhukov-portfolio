import 'package:flutter/material.dart';
import '../widgets/web_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebLayout(
      child: Center(
        child: Text("Welcome to the Home Page!"),
      ),
    );
  }
}
