import 'package:flutter/material.dart';
import '../../helpers/info_data.dart';
import '../../styles/home_styles.dart';
import 'profile_avatar.dart';
import 'profile_info.dart';

class ResponsiveLayout extends StatelessWidget {
  final InfoData info;

  const ResponsiveLayout({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    late final double avatarSize;
    late final Widget content;

    if (width < 600) {
      avatarSize = 240;
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            key: const Key('profile_avatar_small'),
            imagePath: 'assets/profile-no-bg.png',
            size: avatarSize,
          ),
          const SizedBox(height: 24),
          ProfileInfo(
            key: const Key('profile_info_small'),
            info: info,
            isCentered: true,
          ),
        ],
      );
    } else if (width < 900) {
      avatarSize = 300;
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            key: const Key('profile_avatar_medium'),
            imagePath: 'assets/profile-no-bg.png',
            size: avatarSize,
          ),
          const SizedBox(height: 24),
          ProfileInfo(
            key: const Key('profile_info_medium'),
            info: info,
            isCentered: true,
          ),
        ],
      );
    } else {
      avatarSize = 400;
      content = ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileAvatar(
              key: const Key('profile_avatar_large'),
              imagePath: 'assets/profile-no-bg.png',
              size: avatarSize,
            ),
            SizedBox(width: HomeStyles.horizontalSpacing(context)),
            Flexible(
              child: ProfileInfo(
                key: const Key('profile_info_large'),
                info: info,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(16.0), child: content),
    );
  }
}
