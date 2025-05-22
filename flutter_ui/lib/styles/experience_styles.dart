import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ExperienceStyles {
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 32,
  );

  static const TextStyle mainHeader = TextStyle(
    fontSize: 32,
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

  static const BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.backgroundLight,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
    ],
  );

  static const TextStyle projectTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
  );

  static const TextStyle projectCompany = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
  );

  static const TextStyle projectPeriod = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle projectTechnologies = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
  );

  static const TextStyle projectDetails = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  static const Color iconColor = AppColors.textSecondary;
}
