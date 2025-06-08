import 'package:flutter/material.dart';
import '../../helpers/info_data.dart';
import '../../styles/tech_styles.dart';

class SkillsGrid extends StatelessWidget {
  final InfoData infoData;

  const SkillsGrid({super.key, required this.infoData});

  @override
  Widget build(BuildContext context) {
    final categories = infoData.skills.skills;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          infoData.skills.description,
          style: TechStyles.descriptionText(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),

        ...categories.entries.map((entry) {
          final categoryKey = entry.key;
          final skillCategory = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                (skillCategory.title.isNotEmpty ? skillCategory.title : categoryKey),
                style: TechStyles.sectionTitle(context).copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: skillCategory.skills.map((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: TechStyles.skillBoxDecoration,
                    child: Text(skill, style: TechStyles.skillItem(context)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
            ],
          );
        }).toList(),
      ],
    );
  }
}
