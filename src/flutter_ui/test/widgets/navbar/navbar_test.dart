import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ui/widgets/navbar/navbar.dart';
import 'package:flutter_ui/widgets/navbar/top_navbar.dart';
import 'package:flutter_ui/widgets/navbar/bottom_navbar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  GoRouter createRouter() => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Navbar()),
      GoRoute(path: '/about', builder: (context, state) => const Navbar()),
      GoRoute(path: '/tech', builder: (context, state) => const Navbar()),
      GoRoute(path: '/experience', builder: (context, state) => const Navbar()),
    ],
  );

  Future<void> pumpNavbarWithSize(
    WidgetTester tester,
    Size size,
    GoRouter router,
  ) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        builder:
            (context, child) => MediaQuery(
              data: MediaQueryData(size: size),
              child: Scaffold(body: child ?? const SizedBox()),
            ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('Navbar renders correctly', (WidgetTester tester) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(800, 600), router);
    expect(find.byType(Navbar), findsOneWidget);
  });

  testWidgets('TopNavbar is shown on wide screen', (WidgetTester tester) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(800, 600), router);
    expect(find.byType(TopNavbar), findsOneWidget);
    expect(find.byType(BottomNavbar), findsNothing);
  });

  testWidgets('BottomNavbar is shown on narrow screen', (
    WidgetTester tester,
  ) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(400, 600), router);
    expect(find.byType(BottomNavbar), findsOneWidget);
    expect(find.byType(TopNavbar), findsNothing);
  });

  testWidgets('Clicking nav item changes route', (WidgetTester tester) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(800, 600), router);

    final currentLocation = router.routerDelegate.currentConfiguration.uri.path;
    expect(currentLocation, '/');

    final aboutButton = find.text('About');
    expect(aboutButton, findsOneWidget);

    await tester.tap(aboutButton);
    await tester.pumpAndSettle();

    final newLocation = router.routerDelegate.currentConfiguration.uri.path;
    expect(newLocation, '/about');
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('Active nav item styled differently', (
    WidgetTester tester,
  ) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(800, 600), router);

    expect(find.byType(TopNavbar), findsOneWidget);

    Finder homeFinder() => find.descendant(
      of: find.byType(TopNavbar),
      matching: find.text('Home'),
    );

    Finder aboutFinder() => find.descendant(
      of: find.byType(TopNavbar),
      matching: find.text('About'),
    );

    expect(homeFinder(), findsWidgets);
    expect(aboutFinder(), findsWidgets);

    final homeText = tester.widgetList<Text>(homeFinder()).first;
    final aboutText = tester.widgetList<Text>(aboutFinder()).first;

    expect(homeText.style?.fontWeight, FontWeight.w700);
    expect(aboutText.style?.fontWeight, isNot(FontWeight.w700));

    await tester.tap(aboutFinder().first);
    await tester.pumpAndSettle();

    expect(find.byType(TopNavbar), findsOneWidget);

    final newHomeText = tester.widgetList<Text>(homeFinder()).first;
    final newAboutText = tester.widgetList<Text>(aboutFinder()).first;

    expect(newHomeText.style?.fontWeight, isNot(FontWeight.w700));
    expect(newAboutText.style?.fontWeight, FontWeight.w700);
  });

  testWidgets('Navbar has correct number of nav items', (
    WidgetTester tester,
  ) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(800, 600), router);

    final navButtons = find.byType(TextButton);
    expect(navButtons, findsNWidgets(4));
  });

  testWidgets('TopNavbar golden test', (WidgetTester tester) async {
    final router = createRouter();
    await pumpNavbarWithSize(tester, const Size(800, 600), router);

    await expectLater(
      find.byType(TopNavbar),
      matchesGoldenFile('goldens/top_navbar.png'),
    );
  });
}
