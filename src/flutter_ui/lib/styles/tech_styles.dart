import 'package:flutter/material.dart';
import 'colors.dart';

class TechStyles {
  static EdgeInsets contentPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return const EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    if (width < 900) return const EdgeInsets.symmetric(horizontal: 24, vertical: 32);
    return const EdgeInsets.symmetric(horizontal: 48, vertical: 48);
  }

  static TextStyle sectionTitle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 32;
    if (width < 600) fontSize = 24;
    else if (width < 900) fontSize = 28;
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle descriptionText(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 18;
    if (width < 600) fontSize = 14;
    else if (width < 900) fontSize = 16;
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Roboto',
      color: AppColors.textSecondary,
      height: 1.5,
    );
  }

  static EdgeInsets gridPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return const EdgeInsets.symmetric(vertical: 16);
    if (width < 900) return const EdgeInsets.symmetric(vertical: 24);
    return const EdgeInsets.symmetric(vertical: 32);
  }

  static TextStyle skillItem(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 16;
    if (width < 600) fontSize = 14;
    else if (width < 900) fontSize = 15;
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
      height: 1.2,
    );
  }

  static BoxDecoration skillBoxDecoration = const BoxDecoration(
    color: AppColors.backgroundLight,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );

  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return width * 0.95;
    if (width < 900) return 700;
    return 900;
  }
}
