import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/widgets/common/web_layout.dart';
import 'package:flutter_ui/widgets/footer/footer.dart';
import 'package:flutter_ui/widgets/navbar/navbar.dart';
import 'package:go_router/go_router.dart';

void main() {
  Widget buildTestableWidget(Widget child) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => child,
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
    );
  }

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('1. WebLayout renders child content', (tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        const WebLayout(
          child: Text('Test Content'),
        ),
      ),
    );

    expect(find.text('Test Content'), findsOneWidget);
  });

  testWidgets('2. WebLayout shows Navbar and Footer on desktop', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(
        const WebLayout(child: Text('Desktop Test')),
      ),
    );

    expect(find.byType(Navbar), findsOneWidget);
    expect(find.byType(Footer), findsOneWidget);

    tester.binding.window.clearPhysicalSizeTestValue();
    tester.binding.window.clearDevicePixelRatioTestValue();
  });

  testWidgets('3. WebLayout shows Navbar and Footer on mobile', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(400, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(
        const WebLayout(child: Text('Mobile Test')),
      ),
    );

    expect(find.byType(Navbar), findsOneWidget);
    expect(find.byType(Footer), findsOneWidget);

    tester.binding.window.clearPhysicalSizeTestValue();
    tester.binding.window.clearDevicePixelRatioTestValue();
  });

  testWidgets('4. WebLayout hides Footer when showFooter = false', (tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        const WebLayout(
          child: Text('No Footer Test'),
          showFooter: false,
        ),
      ),
    );

    expect(find.byType(Footer), findsNothing);
    expect(find.byType(Navbar), findsOneWidget);
  });

  testWidgets('5. WebLayout handles safe area padding (top inset)', (tester) async {
    final mediaQueryData = MediaQueryData.fromView(tester.view).copyWith(
      padding: const EdgeInsets.only(top: 50),
      viewPadding: const EdgeInsets.only(top: 50),
    );

    await tester.pumpWidget(
      MediaQuery(
        data: mediaQueryData,
        child: buildTestableWidget(
          const WebLayout(
            child: Text('Safe Area Test'),
          ),
        ),
      ),
    );

    expect(find.text('Safe Area Test'), findsOneWidget);
  });

  testWidgets('6. Golden test - WebLayout renders correctly', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      buildTestableWidget(
        const WebLayout(
          child: Center(child: Text('Golden Content')),
        ),
      ),
    );

    await expectLater(
      find.byType(WebLayout),
      matchesGoldenFile('goldens/web_layout_golden.png'),
    );

    tester.binding.window.clearPhysicalSizeTestValue();
    tester.binding.window.clearDevicePixelRatioTestValue();
  });
}
