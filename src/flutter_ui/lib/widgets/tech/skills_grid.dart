import 'package:flutter/material.dart';
import '../../helpers/info_data.dart';
import '../../styles/tech_styles.dart';

class SkillsGrid extends StatefulWidget {
  const SkillsGrid({super.key});

  @override
  State<SkillsGrid> createState() => _SkillsGridState();
}

class _SkillsGridState extends State<SkillsGrid> {
  InfoData? _info;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  Future<void> _loadInfo() async {
    final loadedInfo = await InfoData.load();
    setState(() {
      _info = loadedInfo;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _info == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final categories = _info!.skills.skills;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _info!.skills.description,
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
