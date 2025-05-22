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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < 600) {
          // Мобильная версия
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(imagePath: 'profile-no-bg.png', isLarge: false),
              const SizedBox(height: 24),
              ProfileInfo(info: info, isCentered: true),
            ],
          );
        } else if (width < 900) {
          // Планшетная версия
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(imagePath: 'profile-no-bg.png', isLarge: true),
              const SizedBox(height: 24),
              ProfileInfo(info: info, isCentered: true),
            ],
          );
        } else {
          // Десктопная версия
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileAvatar(imagePath: 'assets/profile-no-bg.png', isLarge: true),
                SizedBox(width: HomeStyles.horizontalSpacing(context)),
                Flexible(child: ProfileInfo(info: info)),
              ],
            ),
          );
        }
      },
    );
  }
}
