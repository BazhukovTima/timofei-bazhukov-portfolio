import 'package:flutter/material.dart';
import 'colors.dart';

class AboutStyles {
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

  static TextStyle expertiseDescription(BuildContext context) {
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
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: Offset(0, 3),
      ),
    ],
  );

  static EdgeInsets sectionPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return const EdgeInsets.all(16);
    if (width < 900) return const EdgeInsets.all(20);
    return const EdgeInsets.all(24);
  }

  static TextStyle cardHeader(BuildContext context) {
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

  static TextStyle cardDescription(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 16;
    if (width < 600) fontSize = 12;
    else if (width < 900) fontSize = 14;
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Roboto',
      color: AppColors.textSecondary,
      height: 1.4,
    );
  }

  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return width * 0.95;
    if (width < 900) return 700;
    return 900;
  }

  static double maxExpertiseTextWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return width * 0.9;
    if (width < 900) return 600;
    return 600;
  }

  static double cardWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return width * 0.9;
    if (width < 900) return 380;
    return 420;
  }

  static double cardHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 240;
    if (width < 900) return 220;
    return 220;
  }

  static double wrapSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 20;
    if (width < 900) return 25;
    return 30;
  }

  static double wrapRunSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 20;
    if (width < 900) return 25;
    return 30;
  }

  static WrapAlignment wrapAlignment = WrapAlignment.center;

  static ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics();

  static String aboutHeaderText = 'About';

  static double verticalSpacingSmall(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 12;
    return 16;
  }

  static double verticalSpacingLarge(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 32;
    return 40;
  }
}
