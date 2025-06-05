import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/widgets/experience/experience_item.dart';

Widget wrapWithMaterial(Widget child) {
  return MaterialApp(home: Scaffold(body: child));
}

void main() {
  const experienceItem = ExperienceItem(
    title: 'Test Project',
    role: 'Lead Developer',
    company: 'Test Company',
    period: '2020–2024',
    details: 'Test Details.',
    technologies: 'Flutter, Dart, Python',
  );

  group('ExperienceItem Widget Tests', () {
    testWidgets('Displays correct title and role', (WidgetTester tester) async {
      await tester.pumpWidget(wrapWithMaterial(experienceItem));
      expect(find.text('Test Project — Lead Developer'), findsOneWidget);
    });

    testWidgets('Displays company, period, technologies and details', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(experienceItem));
      expect(find.text('Test Company'), findsOneWidget);
      expect(find.text('2020–2024'), findsOneWidget);
      expect(find.text('Flutter, Dart, Python'), findsOneWidget);
      expect(find.text('Test Details.'), findsOneWidget);
    });

    testWidgets('Fails when incorrect title is searched', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(experienceItem));
      expect(find.text('Wrong Project'), findsNothing);
    });

    testWidgets('Fails when invalid technology is searched', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(experienceItem));
      expect(find.textContaining('Java'), findsNothing);
    });

    testWidgets('Contains expected vertical spacing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(experienceItem));

      expect(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.height == 8,
        ),
        findsNWidgets(2),
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.height == 4,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.height == 12,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Has a Column with at least 5 children', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(wrapWithMaterial(experienceItem));
      final columnFinder = find.byType(Column);
      final columnWidget = tester.widget<Column>(columnFinder.first);
      expect(columnWidget.children.length, greaterThanOrEqualTo(5));
    });
  });

  testWidgets('Golden test for ExperienceItem', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(body: experienceItem),
      ),
    );
    await expectLater(
      find.byType(ExperienceItem),
      matchesGoldenFile('goldens/experience_item.png'),
    );
  });
}
