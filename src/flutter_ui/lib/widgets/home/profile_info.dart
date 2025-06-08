import 'package:flutter/material.dart';
import '../../helpers/info_data.dart';
import '../../styles/home_styles.dart';
import '../home/social_links.dart';

class ProfileInfo extends StatelessWidget {
  final InfoData info;
  final bool isCentered;

  const ProfileInfo({
    super.key,
    required this.info,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    final textAlign = isCentered ? TextAlign.center : TextAlign.start;
    final crossAxisAlign = isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: HomeStyles.maxTextWidth(context)),
      child: Column(
        crossAxisAlignment: crossAxisAlign,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(info.name, style: HomeStyles.nameTextStyle(context), textAlign: textAlign),
          const SizedBox(height: 8),
          Text(info.role, style: HomeStyles.roleTextStyle(context), textAlign: textAlign),
          const SizedBox(height: 16),
          Text(info.description, style: HomeStyles.descriptionTextStyle(context), textAlign: textAlign),
          const SizedBox(height: 8),
          Text(info.location, style: HomeStyles.descriptionTextStyle(context), textAlign: textAlign),
          const SizedBox(height: 16),
          SocialLinks(social: info.social),
        ],
      ),
    );
  }
}
