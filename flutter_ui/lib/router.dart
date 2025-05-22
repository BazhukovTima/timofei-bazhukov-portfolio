import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/web_layout.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/tech_page.dart';
import 'pages/experience_page.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final currentPath = state.uri.path;
        final showFooter = currentPath != '/experience';

        return WebLayout(
          child: child,
          showFooter: showFooter,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const HomePageContent(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            );
          },
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AboutPageContent(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            );
          },
        ),
        GoRoute(
          path: '/tech',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const TechPageContent(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            );
          },
        ),
        GoRoute(
          path: '/experience',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ExperiencePageContent(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 10),
            );
          },
        ),
      ],
    ),
  ],
);
