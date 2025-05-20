import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebNavbar extends StatelessWidget {
  const WebNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text("Home", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => context.go('/about'),
            child: const Text("About", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => context.go('/tech'),
            child: const Text("Technologies", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => context.go('/experience'),
            child: const Text("Experience", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
