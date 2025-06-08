import 'package:flutter/material.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'router.dart';
import 'styles/colors.dart';

class MyApp extends StatelessWidget {
  final InfoData infoData;

  const MyApp({super.key, required this.infoData});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.backgroundLight,
      secondary: AppColors.primaryLight,
      onSecondary: AppColors.textPrimary,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.background,
      onSurface: AppColors.textPrimary,
    );

    final router = createRouter(infoData);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Timofei Bazhukov Portfolio',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: AppColors.textPrimary),
          titleMedium: TextStyle(color: AppColors.textSecondary),
          bodyMedium: TextStyle(color: AppColors.textDescription),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBg,
            foregroundColor: AppColors.primaryDark,
            side: const BorderSide(color: AppColors.buttonBorder),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
