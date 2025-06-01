import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../styles/app_styles.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  final List<Map<String, dynamic>> routes = const [
    {'title': 'Home', 'path': '/', 'icon': Icons.home},
    {'title': 'About', 'path': '/about', 'icon': Icons.info_outline},
    {'title': 'Technologies', 'path': '/tech', 'icon': Icons.code},
    {'title': 'Experience', 'path': '/experience', 'icon': Icons.work_outline},
  ];

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    int currentIndex = routes.indexWhere((r) => r['path'] == currentRoute);
    if (currentIndex == -1) currentIndex = 0;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: AppStyles.navbarBackgroundColor,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppStyles.navbarBackgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) {
            final path = routes[index]['path']!;
            if (path != currentRoute) {
              context.go(path);
            }
          },
          items: routes.map((route) {
            return BottomNavigationBarItem(
              icon: Icon(route['icon'] as IconData),
              label: route['title'] as String,
            );
          }).toList(),
        ),
      ),
    );
  }
}
