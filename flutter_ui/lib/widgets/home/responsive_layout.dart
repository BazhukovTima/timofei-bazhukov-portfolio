import 'package:flutter/material.dart';
import '../../helpers/info_data.dart';
import '../../styles/home_styles.dart';
import 'profile_avatar.dart';
import 'profile_info.dart';

class ResponsiveLayout extends StatelessWidget {
  final InfoData info;

  const ResponsiveLayout({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;

        if (isNarrow) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(imagePath: 'profile-no-bg.png', isLarge: false),
              const SizedBox(height: 24),
              ProfileInfo(info: info, isCentered: true),
            ],
          );
        } else {
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileAvatar(imagePath: 'assets/profile-no-bg.png', isLarge: true),
                SizedBox(width: HomeStyles.horizontalSpacing),
                Flexible(child: ProfileInfo(info: info)),
              ],
            ),
          );
        }
      },
    );
  }
}
