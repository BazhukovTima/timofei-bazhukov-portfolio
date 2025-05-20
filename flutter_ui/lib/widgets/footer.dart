import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blueGrey.shade50,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        '© 2025 Timofei Bazhukov. Все права защищены.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blueGrey.shade700,
          fontSize: 14,
        ),
      ),
    );
  }
}
