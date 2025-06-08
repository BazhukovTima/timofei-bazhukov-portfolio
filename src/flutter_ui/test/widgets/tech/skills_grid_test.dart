import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/widgets/tech/skills_grid.dart';

void main() {
  InfoData createInfoData({
    String description = 'Test description',
    Map<String, SkillCategory>? skills,
  }) {
    return InfoData(
      name: 'Test Name',
      role: 'Test Role',
      description: 'desc',
      location: 'loc',
      social: [],
      skills: SkillsSection(
        description: description,
        skills:
            skills ??
            {
              'defaultCategory': SkillCategory(
                title: 'Default Category',
                skills: ['Skill 1', 'Skill 2'],
              ),
            },
      ),
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
  }

  testWidgets('1. Renders description and skill categories', (tester) async {
    final infoData = createInfoData();

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: SkillsGrid(infoData: infoData))),
    );

    expect(find.text('Test description'), findsOneWidget);

    expect(find.text('Default Category'), findsOneWidget);
    expect(find.text('Skill 1'), findsOneWidget);
    expect(find.text('Skill 2'), findsOneWidget);
  });

  testWidgets('2. Shows category key if title is empty', (tester) async {
    final skills = {
      'catKey': SkillCategory(title: '', skills: ['Skill A']),
    };
    final infoData = createInfoData(skills: skills);

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: SkillsGrid(infoData: infoData))),
    );

    expect(find.text('catKey'), findsOneWidget);
    expect(find.text('Skill A'), findsOneWidget);
  });

  testWidgets('3. Handles empty skills list in category gracefully', (
    tester,
  ) async {
    final skills = {
      'emptyCat': SkillCategory(title: 'Empty Category', skills: []),
    };
    final infoData = createInfoData(skills: skills);

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: SkillsGrid(infoData: infoData))),
    );

    expect(find.text('Empty Category'), findsOneWidget);

    expect(find.byType(Container), findsNothing);
  });

  testWidgets('4. Handles multiple categories', (tester) async {
    final skills = {
      'cat1': SkillCategory(title: 'Category 1', skills: ['Skill 1']),
      'cat2': SkillCategory(
        title: 'Category 2',
        skills: ['Skill 2', 'Skill 3'],
      ),
    };
    final infoData = createInfoData(skills: skills);

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: SkillsGrid(infoData: infoData))),
    );

    expect(find.text('Category 1'), findsOneWidget);
    expect(find.text('Skill 1'), findsOneWidget);
    expect(find.text('Category 2'), findsOneWidget);
    expect(find.text('Skill 2'), findsOneWidget);
    expect(find.text('Skill 3'), findsOneWidget);
  });

  testWidgets('5. Works correctly with empty skills map', (tester) async {
    final infoData = createInfoData(skills: {});

    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: SkillsGrid(infoData: infoData))),
    );

    expect(find.text('Test description'), findsOneWidget);

    expect(find.byType(Container), findsNothing);
  });

  testWidgets('6. Golden test: SkillsGrid looks correct', (
    WidgetTester tester,
  ) async {
    final skills = {
      'catKey': SkillCategory(title: '', skills: ['Skill A']),
    };
    final infoData = createInfoData(skills: skills);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(width: 400, child: SkillsGrid(infoData: infoData)),
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(SkillsGrid),
      matchesGoldenFile('goldens/skills_grid_golden.png'),
    );
  });
}
