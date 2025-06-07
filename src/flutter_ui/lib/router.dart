import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/common/web_layout.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/tech_page.dart';
import 'pages/experience_page.dart';
import 'helpers/info_data.dart';

GoRouter createRouter(InfoData infoData) {
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final currentPath = state.uri.path;
          final showFooter = currentPath == '/';

          return WebLayout(
            child: child,
            showFooter: showFooter,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: HomePageContent(info: infoData),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            ),
          ),
          GoRoute(
            path: '/about',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: AboutPageContent(info: infoData),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            ),
          ),
          GoRoute(
            path: '/tech',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: TechPageContent(info: infoData),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            ),
          ),
          GoRoute(
            path: '/experience',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: ExperiencePageContent(info: infoData),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            ),
          ),
        ],
      ),
    ],
  );
}
