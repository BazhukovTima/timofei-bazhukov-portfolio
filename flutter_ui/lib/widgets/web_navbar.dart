import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../styles/app_styles.dart';

class WebNavbar extends StatelessWidget {
  const WebNavbar({super.key});

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

    return Container(
      color: AppStyles.navbarBackgroundColor,
      padding: AppStyles.navbarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => context.go('/'),
            child: Text("Home", style: navTextStyle('/')),
          ),
          TextButton(
            onPressed: () => context.go('/about'),
            child: Text("About", style: navTextStyle('/about')),
          ),
          TextButton(
            onPressed: () => context.go('/tech'),
            child: Text("Technologies", style: navTextStyle('/tech')),
          ),
          TextButton(
            onPressed: () => context.go('/experience'),
            child: Text("Experience", style: navTextStyle('/experience')),
          ),
        ],
      ),
    );
  }
}
