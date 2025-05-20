import 'package:flutter/material.dart';
import 'colors.dart';

class AboutStyles {
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 32);

  static const TextStyle mainHeader = TextStyle(
    fontSize: 32, // увеличенный размер заголовка About
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );

  static const TextStyle expertiseDescription = TextStyle(
    fontSize: 18, // увеличенный размер для описания под About
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const BoxDecoration cardDecoration = BoxDecoration(
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

  static const EdgeInsets sectionPadding = EdgeInsets.all(24);

  static const TextStyle cardHeader = TextStyle(
    fontSize: 22, // увеличенный размер заголовков в плашках
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );

  static const TextStyle cardDescription = TextStyle(
    fontSize: 16, // увеличенный размер текста в плашках
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
    height: 1.4,
  );
}
