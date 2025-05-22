import 'package:flutter/material.dart';
import '../../styles/tech_styles.dart';

class SkillsGrid extends StatelessWidget {
  final List<String> skills;

  const SkillsGrid({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: TechStyles.gridPadding,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: skills.map((skill) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: TechStyles.skillBoxDecoration,
            child: Text(skill, style: TechStyles.skillItem),
          );
        }).toList(),
      ),
    );
  }
}
