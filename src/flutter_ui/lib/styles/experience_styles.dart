import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ExperienceStyles {
  static EdgeInsets contentPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return const EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    if (width < 900) return const EdgeInsets.symmetric(horizontal: 24, vertical: 32);
    return const EdgeInsets.symmetric(horizontal: 48, vertical: 48);
  }

  static TextStyle mainHeader(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 32;
    if (width < 600) fontSize = 26;
    else if (width < 900) fontSize = 30;
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

  static BoxDecoration cardDecoration = const BoxDecoration(
    color: AppColors.backgroundLight,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
    ],
  );

  static TextStyle projectTitle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 22;
    if (width < 600) fontSize = 18;
    else if (width < 900) fontSize = 20;
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
      color: AppColors.textPrimary,
    );
  }

  static TextStyle projectCompany(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 16;
    if (width < 600) fontSize = 14;
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      color: AppColors.textSecondary,
    );
  }

  static TextStyle projectPeriod(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 14;
    if (width < 600) fontSize = 12;
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Roboto',
      color: AppColors.textSecondary,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle projectTechnologies(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 14;
    if (width < 600) fontSize = 12;
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Roboto',
      color: AppColors.textSecondary,
    );
  }

  static TextStyle projectDetails(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 14;
    if (width < 600) fontSize = 12;
    return TextStyle(
      fontSize: fontSize,
      color: AppColors.textSecondary,
      height: 1.3,
    );
  }

  static Color iconColor = AppColors.textSecondary;

  static double gridSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 16;
    if (width < 900) return 24;
    return 24;
  }

  static double verticalSpacingSmall(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 12;
    return 16;
  }

  static double verticalSpacingLarge(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 24;
    return 32;
  }
}
