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

  @override
  Widget build(BuildContext context) {
    if (info == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final experience = info!.experience;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300), // расширено с 900
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Experience',
                style: ExperienceStyles.mainHeader,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                experience.overview,
                style: ExperienceStyles.descriptionText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              GridView.builder(
                itemCount: experience.projects.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 2.2, // увеличено в 2 раза (ширина / высота)
                ),
                itemBuilder: (context, index) {
                  final entry = experience.projects.entries.elementAt(index);
                  final project = entry.value;
                  return ExperienceItem(
                    title: entry.key,
                    role: project.role,
                    company: project.company,
                    period: project.period,
                    details: project.details,
                    technologies: project.technologies,
                  );
                },
              ),

              // Отступ перед футером
              const SizedBox(height: 40),

              // Футер, который идет после контента и прокручивается вместе с ним
              Transform.translate(
                offset: const Offset(0, 32), // сдвинуть вверх на 20 пикселей
                child: const Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
