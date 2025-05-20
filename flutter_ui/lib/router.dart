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
        return WebLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePageContent(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutPageContent(),
        ),
        GoRoute(
          path: '/tech',
          builder: (context, state) => const TechPageContent(),
        ),
        GoRoute(
          path: '/experience',
          builder: (context, state) => const ExperiencePageContent(),
        ),
      ],
    ),
  ],
);
