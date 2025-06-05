import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/pages/home_page.dart';
import 'package:flutter_ui/widgets/home/responsive_layout.dart';
import '../mocks/info_data_mock.dart';

void main() {
  late InfoData mockInfoData;

  setUp(() {
    mockInfoData = createMockInfoData();
  });

  testWidgets('HomePageContent displays ResponsiveLayout with provided info', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePageContent(info: mockInfoData),
      ),
    );

    expect(find.byType(ResponsiveLayout), findsOneWidget);

    final responsiveWidget = tester.widget<ResponsiveLayout>(find.byType(ResponsiveLayout));
    expect(responsiveWidget.info, equals(mockInfoData));
  });

  testWidgets('HomePageContent contains Padding and Center widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePageContent(info: mockInfoData),
      ),
    );

    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(Center), findsWidgets);
  });

  testWidgets('HomePageContent does not contain empty Container', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePageContent(info: mockInfoData),
      ),
    );

    final containerFinder = find.byType(Container);
    bool hasEmptyContainer = false;

    for (var element in containerFinder.evaluate()) {
      final widget = element.widget as Container;
      if (widget.child == null && widget.decoration == null && widget.constraints == null) {
        hasEmptyContainer = true;
        break;
      }
    }

    expect(hasEmptyContainer, isFalse);
  });

  testWidgets('HomePageContent contains exactly one ResponsiveLayout', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePageContent(info: mockInfoData),
      ),
    );

    expect(find.byType(ResponsiveLayout), findsOneWidget);
  });

  testWidgets('HomePageContent golden test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomePageContent(info: mockInfoData),
      ),
    );

    await expectLater(
      find.byType(HomePageContent),
      matchesGoldenFile('goldens/home_page_content.png'),
    );
  });
}
