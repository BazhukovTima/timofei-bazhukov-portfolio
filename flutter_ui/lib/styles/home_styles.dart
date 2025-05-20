import 'package:flutter/material.dart';

class HomeStyles {
  static const double avatarSize = 480;
  static const double avatarSizeSmall = 120;

  static const double horizontalSpacing = 48;
  static const double paddingAll = 24;

  static const double maxTextWidth = 600;

  static TextStyle nameTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!;

  static TextStyle roleTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[700]);

  static TextStyle descriptionTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;

  static EdgeInsets contentPadding = const EdgeInsets.all(paddingAll);
}
