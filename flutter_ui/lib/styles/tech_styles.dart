import 'package:flutter/material.dart';
import 'colors.dart';

class TechStyles {
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 32);

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 32, // совпадает с mainHeader в AboutStyles
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );

  static const TextStyle descriptionText = TextStyle(
    fontSize: 18, // совпадает с expertiseDescription
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const EdgeInsets gridPadding = EdgeInsets.symmetric(vertical: 24);

  static const TextStyle skillItem = TextStyle(
    fontSize: 16, // совпадает с cardDescription
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );

  static const BoxDecoration skillBoxDecoration = BoxDecoration(
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
}
