import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../helpers/info_data.dart';
import '../../styles/colors.dart';

class SocialLinks extends StatelessWidget {
  final List<SocialLink> social;

  const SocialLinks({super.key, required this.social});

  IconData? _getIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'linkedin':
        return FontAwesomeIcons.linkedinIn;
      case 'facebook':
        return FontAwesomeIcons.facebookF;
      case 'github':
        return FontAwesomeIcons.github;
      case 'email':
        return FontAwesomeIcons.envelope;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: social.map((link) {
        final icon = _getIcon(link.platform);
        if (icon == null) return const SizedBox.shrink();

        return _SocialIconButton(
          icon: icon,
          onTap: () => launchUrl(Uri.parse(link.url)),
        );
      }).toList(),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.linear,
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.socialHoverBg.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              color: AppColors.socialLink,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

