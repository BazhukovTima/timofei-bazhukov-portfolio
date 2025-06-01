import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../styles/tech_styles.dart';
import '../widgets/tech/skills_grid.dart';

class TechPageContent extends StatefulWidget {
  const TechPageContent({super.key});

  @override
  State<TechPageContent> createState() => _TechPageContentState();
}

class _TechPageContentState extends State<TechPageContent> {
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

  @override
  Widget build(BuildContext context) {
    if (info == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final skills = info!.skills;

    return SingleChildScrollView(
      padding: TechStyles.contentPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: TechStyles.maxContentWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // <-- тут исправил
            children: [
              Text(
                'Technologies and Frameworks',
                style: TechStyles.sectionTitle(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                skills.description,
                style: TechStyles.descriptionText(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              SkillsGrid(skills: skills.skills),
            ],
          ),
        ),
      ),
    );
  }
}
