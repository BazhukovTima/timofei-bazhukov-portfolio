import 'package:flutter/material.dart';
import '../../styles/experience_styles.dart';

class ExperienceItem extends StatelessWidget {
  final String title;
  final String role;
  final String company;
  final String period;
  final String details;
  final String technologies;

  const ExperienceItem({
    Key? key,
    required this.title,
    required this.role,
    required this.company,
    required this.period,
    required this.details,
    required this.technologies,
  }) : super(key: key);

  Widget _buildRow(IconData icon, String text, TextStyle style) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: ExperienceStyles.iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: style,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ExperienceStyles.cardDecoration,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title — $role',
            style: ExperienceStyles.projectTitle(context),
          ),
          SizedBox(height: 8),
          _buildRow(Icons.business_outlined, company, ExperienceStyles.projectCompany(context)),
          SizedBox(height: 4),
          _buildRow(Icons.calendar_today_outlined, period, ExperienceStyles.projectPeriod(context)),
          SizedBox(height: 12),
          _buildRow(Icons.code_outlined, technologies, ExperienceStyles.projectTechnologies(context)),
          SizedBox(height: 8),
          Text(
            details,
            style: ExperienceStyles.projectDetails(context),
          ),
        ],
      ),
    );
  }
}
