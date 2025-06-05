import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/widgets/footer/footer.dart';

Widget wrapWithMaterial(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  final currentYear = DateTime.now().year;

  group('Footer Widget Tests', () {
    testWidgets('Displays current year and correct text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(const Footer()));
      expect(
        find.text('© $currentYear Timofei Bazhukov. All rights reserved.'),
        findsOneWidget,
      );
    });

    testWidgets('Text is center aligned', (WidgetTester tester) async {
      await tester.pumpWidget(wrapWithMaterial(const Footer()));
      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('Fails if incorrect year is present', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(const Footer()));
      final wrongYear = currentYear - 1;
      expect(find.textContaining('$wrongYear'), findsNothing);
    });

    testWidgets('Footer container takes full width', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(const Footer()));

      final renderBox = tester.renderObject<RenderBox>(find.byType(Container));
      final screenWidth =
          tester.binding.window.physicalSize.width /
          tester.binding.window.devicePixelRatio;

      expect(renderBox.size.width, screenWidth);
    });
  });

  testWidgets('Golden test for Footer widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(body: const Footer()),
      ),
    );

    await expectLater(
      find.byType(Footer),
      matchesGoldenFile('goldens/footer.png'),
    );
  });
}
