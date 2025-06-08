import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/pages/about_page.dart';
import '../mocks/info_data_mock.dart';

void main() {
  late InfoData mockInfoData;

  setUp(() {
    mockInfoData = createMockInfoData();
  });

  testWidgets('AboutPageContent displays About header and expertise description', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutPageContent(info: mockInfoData),
      ),
    );

    expect(find.text('About'), findsOneWidget);
    expect(find.text(mockInfoData.about.expertise.description), findsOneWidget);
  });

  testWidgets('AboutPageContent displays all About sections', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutPageContent(info: mockInfoData),
      ),
    );

    for (final section in [
      mockInfoData.about.technicalStack,
      mockInfoData.about.currentFocus,
      mockInfoData.about.mobileDevelopment,
      mockInfoData.about.softSkills,
    ]) {
      expect(find.text(section.header), findsOneWidget);
      expect(find.text(section.description), findsOneWidget);
    }
  });

  testWidgets('AboutPageContent does not display unrelated header', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutPageContent(info: mockInfoData),
      ),
    );

    expect(find.text('Non-existent Header'), findsNothing);
  });

  testWidgets('AboutPageContent does not contain empty Text widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutPageContent(info: mockInfoData),
      ),
    );

    final textWidgets = find.byType(Text);

    bool hasEmptyText = false;
    for (var element in textWidgets.evaluate()) {
      final widget = element.widget as Text;
      if (widget.data == null || widget.data!.trim().isEmpty) {
        hasEmptyText = true;
        break;
      }
    }

    expect(hasEmptyText, isFalse);
  });

  testWidgets('AboutPageContent contains Wrap and Column widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutPageContent(info: mockInfoData),
      ),
    );

    expect(find.byType(Wrap), findsOneWidget);
    expect(find.byType(Column), findsWidgets);
  });

  testWidgets('AboutPageContent golden test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AboutPageContent(info: mockInfoData),
      ),
    );

    await expectLater(
      find.byType(AboutPageContent),
      matchesGoldenFile('goldens/about_page_content.png'),
    );
  });
}
