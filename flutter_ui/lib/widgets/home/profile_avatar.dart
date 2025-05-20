import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/home_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final bool isLarge;

  const ProfileAvatar({
    Key? key,
    required this.imagePath,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = isLarge ? HomeStyles.avatarSize : HomeStyles.avatarSizeSmall;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryDark.withOpacity(0.5), // более прозрачный
          width: 2, // тоньше рамка
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
