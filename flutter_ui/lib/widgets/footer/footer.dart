import 'package:flutter/material.dart';
import '../../styles/app_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: AppStyles.footerPadding,
      child: Text(
        '© $currentYear Timofei Bazhukov. All rights reserved.',
        textAlign: TextAlign.center,
        style: AppStyles.footerTextStyle(context),
      ),
    );
  }
}
