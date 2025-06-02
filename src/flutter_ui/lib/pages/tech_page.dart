import 'package:flutter/material.dart';
import '../styles/tech_styles.dart';
import '../widgets/tech/skills_grid.dart';

class TechPageContent extends StatelessWidget {
  const TechPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: TechStyles.contentPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: TechStyles.maxContentWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Technologies and Frameworks',
                style: TechStyles.sectionTitle(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const SkillsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
