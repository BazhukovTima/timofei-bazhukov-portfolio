import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  final List<SocialLink> social;

  const SocialLinks({super.key, required this.social});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: social.map((link) {
        return InkWell(
          onTap: () async {
            final uri = Uri.parse(link.url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          child: Chip(
            label: Text(link.platform),
            backgroundColor: Colors.blueGrey.shade100,
          ),
        );
      }).toList(),
    );
  }
}
