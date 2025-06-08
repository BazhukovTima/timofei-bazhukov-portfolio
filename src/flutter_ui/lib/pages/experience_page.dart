import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../styles/experience_styles.dart';
import '../widgets/experience/experience_item.dart';

class ExperiencePageContent extends StatelessWidget {
  final InfoData info;

  const ExperiencePageContent({super.key, required this.info});

  int _calculateColumns(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    return 2;
  }

  List<Widget> _buildRows(
    List<Widget> items,
    int columns,
    double spacing,
    double cardWidth,
  ) {
    List<Widget> rows = [];
    for (int i = 0; i < items.length; i += columns) {
      final rowItems = items.sublist(
        i,
        i + columns > items.length ? items.length : i + columns,
      );

      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowItems
                .map((item) {
                  if (rowItems.length == 1) {
                    return SizedBox(width: cardWidth, child: item);
                  } else {
                    return Expanded(child: item);
                  }
                })
                .expand((widget) => [widget, SizedBox(width: spacing)])
                .toList()
              ..removeLast(),
          ),
        ),
      );

      rows.add(SizedBox(height: spacing));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final experience = info.experience;
    final maxContentWidth = 1400.0;
    final width = MediaQuery.of(context).size.width;
    final effectiveWidth = width > maxContentWidth ? maxContentWidth : width;
    final paddingHorizontal = ExperienceStyles.contentPadding(context).horizontal;
    final spacing = ExperienceStyles.gridSpacing(context);
    final columns = _calculateColumns(width);

    final cardWidth =
        (effectiveWidth - paddingHorizontal - (columns - 1) * spacing) /
            columns;

    final items = experience.projects.entries.map((entry) {
      final project = entry.value;
      return ExperienceItem(
        title: entry.key,
        role: project.role,
        company: project.company,
        period: project.period,
        details: project.details,
        technologies: project.technologies,
      );
    }).toList();

    return SingleChildScrollView(
      padding: ExperienceStyles.contentPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Experience',
                style: ExperienceStyles.mainHeader(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ExperienceStyles.verticalSpacingSmall(context)),
              Text(
                experience.overview,
                style: ExperienceStyles.descriptionText(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ExperienceStyles.verticalSpacingLarge(context)),

              ..._buildRows(items, columns, spacing, cardWidth),
            ],
          ),
        ),
      ),
    );
  }
}
