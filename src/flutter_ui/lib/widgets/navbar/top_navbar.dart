import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../styles/app_styles.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  final List<Map<String, dynamic>> routes = const [
    {'title': 'Home', 'path': '/', 'icon': Icons.home},
    {'title': 'About', 'path': '/about', 'icon': Icons.info_outline},
    {'title': 'Technologies', 'path': '/tech', 'icon': Icons.code},
    {'title': 'Experience', 'path': '/experience', 'icon': Icons.work_outline},
  ];

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;
    final screenWidth = MediaQuery.of(context).size.width;

    double horizontalPadding;
    if (screenWidth < 600) {
      horizontalPadding = 8;
    } else if (screenWidth < 900) {
      horizontalPadding = 20;
    } else {
      horizontalPadding = 30;
    }

    return Container(
      color: AppStyles.navbarBackgroundColor,
      padding: AppStyles.navbarPadding,
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: horizontalPadding,
          children: routes.map((route) {
            final path = route['path']!;
            final title = route['title']!;
            final isActive = currentRoute == path;
            final style = AppStyles.navbarTextStyle.copyWith(
              color: isActive ? Colors.white : Colors.white70,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
              fontSize: isActive ? 18 : 16,
              decoration: TextDecoration.none,
            );
            return TextButton(
              onPressed: () => context.go(path),
              child: Text(title, style: style),
            );
          }).toList(),
        ),
      ),
    );
  }
}
