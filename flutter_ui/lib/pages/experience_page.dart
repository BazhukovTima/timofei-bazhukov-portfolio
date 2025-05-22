import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/footer.dart';
import '../helpers/info_data.dart';
import '../styles/experience_styles.dart';
import '../widgets/experience/experience_item.dart';

class ExperiencePageContent extends StatefulWidget {
  const ExperiencePageContent({super.key});

  @override
  State<ExperiencePageContent> createState() => _ExperiencePageContentState();
}

class _ExperiencePageContentState extends State<ExperiencePageContent> {
  InfoData? info;

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  Future<void> _loadInfo() async {
    final loadedInfo = await InfoData.load();
    setState(() {
      info = loadedInfo;
    });
  }

  int _calculateColumns(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    return 2; // 2 колонки на больших экранах
  }

  @override
  Widget build(BuildContext context) {
    if (info == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final experience = info!.experience;
    final width = MediaQuery.of(context).size.width;
    final columns = _calculateColumns(width);

    const maxContentWidth = 1300.0;
    final effectiveWidth = width > maxContentWidth ? maxContentWidth : width;

    final horizontalPadding = ExperienceStyles.contentPadding(context).horizontal;
    final spacing = 24.0;

    final cardWidth = (effectiveWidth - horizontalPadding - (columns - 1) * spacing) / columns;

    return SingleChildScrollView(
      padding: ExperienceStyles.contentPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxContentWidth),
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
              Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: experience.projects.entries.map((entry) {
                  final project = entry.value;
                  return SizedBox(
                    width: cardWidth,
                    child: ExperienceItem(
                      title: entry.key,
                      role: project.role,
                      company: project.company,
                      period: project.period,
                      details: project.details,
                      technologies: project.technologies,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              Transform.translate(
                offset: const Offset(0, 32),
                child: const Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
