// lib/router.dart
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/tech_page.dart';
import 'pages/experience_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(path: '/tech', builder: (context, state) => const TechPage()),
    GoRoute(path: '/experience', builder: (context, state) => const ExperiencePage()),
  ],
);
