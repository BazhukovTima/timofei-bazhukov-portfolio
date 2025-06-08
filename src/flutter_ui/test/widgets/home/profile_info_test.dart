import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ui/widgets/home/profile_info.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/widgets/home/social_links.dart';

void main() {
  final testInfo = InfoData(
    name: 'John Doe',
    role: 'Flutter Developer',
    description: 'Passionate developer',
    location: 'San Francisco',
    social: [
      SocialLink(platform: 'github', url: 'https://github.com/johndoe'),
      SocialLink(platform: 'twitter', url: 'https://twitter.com/johndoe'),
    ],
    skills: SkillsSection(description: '', skills: {}),
    about: AboutSection(
      header: '',
      expertise: ExpertiseSection(header: '', description: ''),
      technicalStack: AboutItem(header: '', description: ''),
      currentFocus: AboutItem(header: '', description: ''),
      mobileDevelopment: AboutItem(header: '', description: ''),
      softSkills: AboutItem(header: '', description: ''),
    ),
    experience: ExperienceSection(overview: '', projects: {}),
    frameworks: [],
  );

  testWidgets('renders all text fields correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo)));

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.text('Passionate developer'), findsOneWidget);
    expect(find.text('San Francisco'), findsOneWidget);
  });

  testWidgets('renders SocialLinks widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo)));

    expect(find.byType(SocialLinks), findsOneWidget);
  });

  testWidgets('text aligns start when isCentered=false', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo, isCentered: false)));

    final nameText = tester.widget<Text>(find.text('John Doe'));
    expect(nameText.textAlign, TextAlign.start);
  });

  testWidgets('text aligns center when isCentered=true', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo, isCentered: true)));

    final nameText = tester.widget<Text>(find.text('John Doe'));
    expect(nameText.textAlign, TextAlign.center);
  });

  testWidgets('column crossAxisAlignment is center when isCentered=true', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo, isCentered: true)));

    final column = tester.widget<Column>(find.byType(Column));
    expect(column.crossAxisAlignment, CrossAxisAlignment.center);
  });

  testWidgets('column crossAxisAlignment is start when isCentered=false', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo, isCentered: false)));

    final column = tester.widget<Column>(find.byType(Column));
    expect(column.crossAxisAlignment, CrossAxisAlignment.start);
  });

  testWidgets('golden test ProfileInfo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileInfo(info: testInfo, isCentered: false)));

    await expectLater(
      find.byType(ProfileInfo),
      matchesGoldenFile('goldens/profile_info.png'),
    );
  });
}
