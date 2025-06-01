import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  static TextStyle footerTextStyle(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width < 600 ? 12 : 14,
      color: Colors.grey[500],
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static const EdgeInsets footerPadding = EdgeInsets.symmetric(vertical: 16);

  static const Color footerBackgroundColor = AppColors.backgroundLight;

  static const Color navbarBackgroundColor = AppColors.primaryDark;

  static const TextStyle navbarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
  );

  static const EdgeInsets navbarPadding = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 16,
  );

  static const TextStyle baseTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );

  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );
}
