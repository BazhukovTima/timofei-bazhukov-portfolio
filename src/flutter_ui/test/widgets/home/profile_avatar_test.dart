import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/widgets/home/profile_avatar.dart';

void main() {
  const testImage = 'assets/profile-no-bg.png';

  testWidgets('renders correctly with large avatar size', (tester) async {
    const avatarSize = 400.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileAvatar(imagePath: testImage, size: avatarSize),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));
    final constraints = container.constraints!;

    expect(constraints.maxWidth, equals(avatarSize));
    expect(constraints.maxHeight, equals(avatarSize));
  });

  testWidgets('renders correctly with small avatar size', (tester) async {
    const avatarSize = 240.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileAvatar(imagePath: testImage, size: avatarSize),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));
    final constraints = container.constraints!;

    expect(constraints.maxWidth, equals(avatarSize));
    expect(constraints.maxHeight, equals(avatarSize));
  });

  testWidgets('displays correct image asset', (tester) async {
    const avatarSize = 240.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileAvatar(imagePath: testImage, size: avatarSize),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.image!.image, isA<AssetImage>());
    expect(
      (decoration.image!.image as AssetImage).assetName,
      equals(testImage),
    );
  });

  testWidgets('has circular shape and border', (tester) async {
    const avatarSize = 300.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileAvatar(imagePath: testImage, size: avatarSize),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.shape, BoxShape.circle);
    expect(decoration.border, isNotNull);
  });

  testWidgets('renders with given key', (tester) async {
    const testKey = Key('profile-avatar');
    const avatarSize = 240.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProfileAvatar(
            imagePath: testImage,
            size: avatarSize,
            key: testKey,
          ),
        ),
      ),
    );

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('golden test — large ProfileAvatar', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(child: ProfileAvatar(imagePath: testImage, size: 400)),
      ),
    );

    await expectLater(
      find.byType(ProfileAvatar),
      matchesGoldenFile('goldens/profile_avatar_large.png'),
    );
  });

  testWidgets('golden test — small ProfileAvatar', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(child: ProfileAvatar(imagePath: testImage, size: 240)),
      ),
    );

    await expectLater(
      find.byType(ProfileAvatar),
      matchesGoldenFile('goldens/profile_avatar_small.png'),
    );
  });
}
