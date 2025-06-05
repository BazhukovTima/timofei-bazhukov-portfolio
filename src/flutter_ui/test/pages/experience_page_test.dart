import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/pages/experience_page.dart';
import 'package:flutter_ui/widgets/experience/experience_item.dart';
import '../mocks/info_data_mock.dart';

void main() {
  late InfoData mockInfoData;

  setUp(() {
    mockInfoData = createMockInfoData();
  });

  testWidgets('ExperiencePageContent displays Experience header and overview', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ExperiencePageContent(info: mockInfoData)),
    );

    expect(find.text('Experience'), findsOneWidget);
    expect(find.text(mockInfoData.experience.overview), findsOneWidget);
  });

  testWidgets('ExperiencePageContent displays ExperienceItem for each project', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ExperiencePageContent(info: mockInfoData)),
    );
    await tester.pumpAndSettle();

    final projects = mockInfoData.experience.projects;

    expect(find.byType(ExperienceItem), findsNWidgets(projects.length));

    for (var projectName in projects.keys) {
      final expectedTitleText = '$projectName — ${projects[projectName]?.role ?? ''}';
      expect(find.text(expectedTitleText), findsOneWidget);
    }
  });

  testWidgets('ExperiencePageContent does not display non-existent project', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ExperiencePageContent(info: mockInfoData)),
    );

    expect(find.text('Non-existent Project'), findsNothing);
  });

  testWidgets('ExperiencePageContent does not contain empty ExperienceItem', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ExperiencePageContent(info: mockInfoData)),
    );

    final items = find.byType(ExperienceItem);

    bool hasEmptyItem = false;
    for (var element in items.evaluate()) {
      final widget = element.widget as ExperienceItem;
      if ((widget.title.trim().isEmpty) ||
          (widget.role.trim().isEmpty) ||
          (widget.company.trim().isEmpty)) {
        hasEmptyItem = true;
        break;
      }
    }

    expect(hasEmptyItem, isFalse);
  });

  testWidgets('ExperiencePageContent contains SingleChildScrollView, Center and Column', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ExperiencePageContent(info: mockInfoData)),
    );

    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.byType(Center), findsWidgets);
    expect(find.byType(Column), findsWidgets);
  });

  testWidgets('ExperiencePageContent golden test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ExperiencePageContent(info: mockInfoData)),
    );

    await expectLater(
      find.byType(ExperiencePageContent),
      matchesGoldenFile('goldens/experience_page_content.png'),
    );
  });
}
