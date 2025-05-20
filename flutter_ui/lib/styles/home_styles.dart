import 'package:flutter/material.dart';

class HomeStyles {
  static const double avatarSize = 480;
  static const double avatarSizeSmall = 120;

  static const double horizontalSpacing = 48;
  static const double paddingAll = 24;

  static const double maxTextWidth = 600;

  // Новые размеры шрифта
  static const double nameFontSize = 34;
  static const double roleFontSize = 22;
  static const double descriptionFontSize = 18;
  static const double locationFontSize = 18;

  static TextStyle nameTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: nameFontSize,
            fontWeight: FontWeight.bold,
            height: 1.2,
          );

  static TextStyle roleTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: roleFontSize,
            color: Colors.grey[700],
            height: 1.4,
          );

  static TextStyle descriptionTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: descriptionFontSize,
            color: Colors.grey[800],
            height: 1.5,
          );

  static EdgeInsets contentPadding = const EdgeInsets.all(paddingAll);
}
