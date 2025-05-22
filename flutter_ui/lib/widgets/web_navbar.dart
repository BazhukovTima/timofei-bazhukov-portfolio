import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../styles/app_styles.dart';

class WebNavbar extends StatelessWidget {
  const WebNavbar({super.key});

  final _routes = const [
    {'title': 'Home', 'path': '/'},
    {'title': 'About', 'path': '/about'},
    {'title': 'Technologies', 'path': '/tech'},
    {'title': 'Experience', 'path': '/experience'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    TextStyle navTextStyle(String route) {
      final bool isActive = currentRoute == route;
      return AppStyles.navbarTextStyle.copyWith(
        color: isActive ? Colors.white : Colors.white70,
        fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
        fontSize: isActive ? 18 : 16,
        decoration: TextDecoration.none,
      );
    }

    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      // Мобильная версия - кнопка меню
      return Container(
        color: AppStyles.navbarBackgroundColor,
        padding: AppStyles.navbarPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (path) => context.go(path),
              itemBuilder: (context) {
                return _routes.map((route) {
                  return PopupMenuItem<String>(
                    value: route['path']!,
                    child: Text(route['title']!),
                  );
                }).toList();
              },
            ),
          ],
        ),
      );
    }

    // Десктопная версия - обычное меню
    return Container(
      color: AppStyles.navbarBackgroundColor,
      padding: AppStyles.navbarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _routes.map((route) {
          final path = route['path']!;
          final title = route['title']!;
          return TextButton(
            onPressed: () => context.go(path),
            child: Text(title, style: navTextStyle(path)),
          );
        }).toList(),
      ),
    );
  }
}
