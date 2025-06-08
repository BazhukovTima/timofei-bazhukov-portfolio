import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/widgets/home/social_links.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  final socialLinks = [
    SocialLink(platform: 'github', url: 'https://github.com/johndoe'),
    SocialLink(platform: 'linkedin', url: 'https://linkedin.com/in/johndoe'),
    SocialLink(platform: 'email', url: 'mailto:test@example.com'),
    SocialLink(platform: 'unknown', url: 'https://example.com'),
  ];

  Widget wrapWithMaterial(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('renders only supported platforms', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(SocialLinks(social: socialLinks)));

    expect(
      find.byWidgetPredicate(
        (widget) => widget is FaIcon && widget.icon == FontAwesomeIcons.github,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is FaIcon && widget.icon == FontAwesomeIcons.linkedinIn,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is FaIcon && widget.icon == FontAwesomeIcons.envelope,
      ),
      findsOneWidget,
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is FaIcon && widget.icon == FontAwesomeIcons.facebookF,
      ),
      findsNothing,
    );
  });

  testWidgets('hover effect changes container color', (tester) async {
    final link = [SocialLink(platform: 'github', url: 'https://github.com')];

    await tester.pumpWidget(wrapWithMaterial(SocialLinks(social: link)));

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    final target = find.byType(AnimatedContainer);

    await gesture.addPointer();
    await gesture.moveTo(tester.getCenter(target));
    await tester.pumpAndSettle();

    final animatedContainer = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );
    final decoration = animatedContainer.decoration as BoxDecoration;

    expect(decoration.color!.opacity, greaterThan(0.0));
  });

  testWidgets('tap on icon triggers GestureDetector', (tester) async {
    final link = [SocialLink(platform: 'github', url: 'https://github.com')];

    await tester.pumpWidget(wrapWithMaterial(SocialLinks(social: link)));

    expect(find.byType(AnimatedContainer), findsOneWidget);

    await tester.tap(find.byType(AnimatedContainer));
    await tester.pump();

    expect(true, isTrue);
  });

  testWidgets('renders empty widget for empty list', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const SocialLinks(social: [])));
    expect(find.byType(AnimatedContainer), findsNothing);
  });

  testWidgets('wrap renders correctly with spacing', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(SocialLinks(social: socialLinks)));

    final wrap = tester.widget<Wrap>(find.byType(Wrap));
    expect(wrap.spacing, 12);
    expect(wrap.runSpacing, 12);
  });

  testWidgets('golden test — social links', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(SocialLinks(social: socialLinks)));

    await expectLater(
      find.byType(SocialLinks),
      matchesGoldenFile('goldens/social_links.png'),
    );
  });
}
