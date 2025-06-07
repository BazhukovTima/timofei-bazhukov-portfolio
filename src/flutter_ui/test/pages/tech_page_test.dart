import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/pages/tech_page.dart';
import 'package:flutter_ui/widgets/tech/skills_grid.dart';
import '../mocks/info_data_mock.dart';

void main() {
  late InfoData mockInfoData;

  setUp(() {
    mockInfoData = createMockInfoData();
  });

  testWidgets('TechPageContent displays section title', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: TechPageContent(info: mockInfoData)),
    );

    expect(find.text('Technologies and Frameworks'), findsOneWidget);
  });

  testWidgets('TechPageContent contains SkillsGrid with provided info', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: TechPageContent(info: mockInfoData)),
    );

    expect(find.byType(SkillsGrid), findsOneWidget);

    final widget = tester.widget<SkillsGrid>(find.byType(SkillsGrid));
    expect(widget.infoData, equals(mockInfoData));
  });

  testWidgets('TechPageContent does not contain unrelated text', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: TechPageContent(info: mockInfoData)),
    );

    expect(find.text('Unrelated Title'), findsNothing);
  });

  testWidgets('TechPageContent does not contain empty Text widgets', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(home: TechPageContent(info: mockInfoData)),
    );

    final textWidgets = find.byType(Text);
    bool hasEmptyText = false;

    for (var element in textWidgets.evaluate()) {
      final widget = element.widget as Text;
      if (widget.data != null && widget.data!.trim().isEmpty) {
        hasEmptyText = true;
        break;
      }
    }

    expect(hasEmptyText, isFalse);
  });

  testWidgets(
    'TechPageContent contains SingleChildScrollView, Center and Column',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: TechPageContent(info: mockInfoData)),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
    },
  );

  testWidgets('TechPageContent golden test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: TechPageContent(info: mockInfoData)),
    );

    await expectLater(
      find.byType(TechPageContent),
      matchesGoldenFile('goldens/tech_page_content.png'),
    );
  });
}
