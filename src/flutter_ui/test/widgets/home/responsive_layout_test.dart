import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/widgets/home/responsive_layout.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:flutter_ui/widgets/home/profile_avatar.dart';
import 'package:flutter_ui/widgets/home/profile_info.dart';

void main() {
  final testInfo = InfoData(
    name: 'John Doe',
    role: 'Flutter Developer',
    description: 'Passionate developer',
    location: 'San Francisco',
    social: [],
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

  testWidgets('Small screen layout (<600)', (tester) async {
    const size = Size(500, 800);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(data: const MediaQueryData(size: size), child: ResponsiveLayout(info: testInfo)),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('profile_avatar_small')), findsOneWidget);
    expect(find.byKey(const Key('profile_info_small')), findsOneWidget);

    final avatar = tester.widget<ProfileAvatar>(find.byKey(const Key('profile_avatar_small')));
    expect(avatar.size, 240);

    final info = tester.widget<ProfileInfo>(find.byKey(const Key('profile_info_small')));
    expect(info.isCentered, isTrue);
  });

  testWidgets('Medium screen layout (600-899)', (tester) async {
    const size = Size(800, 800);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(data: const MediaQueryData(size: size), child: ResponsiveLayout(info: testInfo)),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('profile_avatar_medium')), findsOneWidget);
    expect(find.byKey(const Key('profile_info_medium')), findsOneWidget);

    final avatar = tester.widget<ProfileAvatar>(find.byKey(const Key('profile_avatar_medium')));
    expect(avatar.size, 300);
  });

  testWidgets('Large screen layout (>=900)', (tester) async {
    const size = Size(1200, 800);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(data: const MediaQueryData(size: size), child: ResponsiveLayout(info: testInfo)),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('profile_avatar_large')), findsOneWidget);
    expect(find.byKey(const Key('profile_info_large')), findsOneWidget);

    final avatar = tester.widget<ProfileAvatar>(find.byKey(const Key('profile_avatar_large')));
    expect(avatar.size, 400);
  });

  testWidgets('Negative test: Large avatar must not appear on small screen', (tester) async {
    const size = Size(500, 800);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(data: const MediaQueryData(size: size), child: ResponsiveLayout(info: testInfo)),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('profile_avatar_large')), findsNothing);
    expect(find.byKey(const Key('profile_info_large')), findsNothing);
  });

  testWidgets('Golden test: Small layout snapshot', (tester) async {
    const size = Size(500, 800);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(data: const MediaQueryData(size: size), child: ResponsiveLayout(info: testInfo)),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(ResponsiveLayout),
      matchesGoldenFile('goldens/responsive_layout_small.png'),
    );
  });
}
