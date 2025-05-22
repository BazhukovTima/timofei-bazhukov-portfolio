import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/home_styles.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final bool isLarge;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = isLarge ? HomeStyles.avatarSize(context) : HomeStyles.avatarSizeSmall(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primaryDark.withOpacity(0.5), // поправил метод .withOpacity()
          width: 2,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
