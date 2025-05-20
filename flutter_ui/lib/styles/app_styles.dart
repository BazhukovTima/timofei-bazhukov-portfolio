import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  // Текстовые стили
  static const TextStyle footerTextStyle = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary, // темно-серый / синий для футера
    fontFamily: 'Roboto', // классический шрифт Flutter, если хочешь
  );

  static const EdgeInsets footerPadding = EdgeInsets.symmetric(vertical: 16);

  static const Color footerBackgroundColor = AppColors.backgroundLight;

  // Navbar стили
  static const Color navbarBackgroundColor = AppColors.primaryDark;

  static const TextStyle navbarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
  );

  static const EdgeInsets navbarPadding =
      EdgeInsets.symmetric(horizontal: 32, vertical: 16);

  // Общие текстовые стили для сайта
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
