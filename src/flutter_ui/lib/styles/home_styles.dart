import 'package:flutter/material.dart';

class HomeStyles {
  static double avatarSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width * 0.8;
    }
    if (width < 900) return 280;
    return 480;
  }

  static double avatarSizeSmall(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width * 0.5;
    }
    if (width < 900) return 120;
    return 160;
  }

  static double horizontalSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 16;
    if (width < 900) return 32;
    return 48;
  }

  static EdgeInsets contentPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return const EdgeInsets.all(12);
    if (width < 900) return const EdgeInsets.all(16);
    return const EdgeInsets.all(24);
  }

  static double maxTextWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return width * 0.9;
    if (width < 900) return 500;
    return 600;
  }

  static double nameFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 24;
    if (width < 900) return 28;
    return 34;
  }

  static double roleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 14;
    if (width < 900) return 18;
    return 22;
  }

  static double descriptionFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 12;
    if (width < 900) return 14;
    return 18;
  }

  static double locationFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 12;
    if (width < 900) return 14;
    return 18;
  }

  static TextStyle nameTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: nameFontSize(context),
            fontWeight: FontWeight.bold,
            height: 1.2,
          );

  static TextStyle roleTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: roleFontSize(context),
            color: Colors.grey[700],
            height: 1.4,
          );

  static TextStyle descriptionTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: descriptionFontSize(context),
            color: Colors.grey[800],
            height: 1.5,
          );

  static EdgeInsets get contentPaddingAll => const EdgeInsets.all(24);
}
