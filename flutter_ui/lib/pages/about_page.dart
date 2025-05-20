import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../styles/about_styles.dart';

class AboutPageContent extends StatefulWidget {
  const AboutPageContent({super.key});

  @override
  State<AboutPageContent> createState() => _AboutPageContentState();
}

class _AboutPageContentState extends State<AboutPageContent> {
  Map<String, dynamic>? aboutData;

  @override
  void initState() {
    super.initState();
    loadAboutData();
  }

  Future<void> loadAboutData() async {
    final jsonString = await rootBundle.loadString('assets/info.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    setState(() {
      aboutData = jsonMap['about'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (aboutData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final expertiseDescription = aboutData!['expertise']['description'] as String;

    final sections = [
      aboutData!['technicalStack'],
      aboutData!['currentFocus'],
      aboutData!['mobileDevelopment'],
      aboutData!['softSkills'],
    ];

    return Padding(
      padding: AboutStyles.contentPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('About', style: AboutStyles.mainHeader),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  expertiseDescription,
                  style: AboutStyles.expertiseDescription,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 30,      // горизонтальный отступ между плашками
                runSpacing: 30,   // вертикальный отступ между плашками
                alignment: WrapAlignment.center,
                children: sections.map<Widget>((section) {
                  return SizedBox(
                    width: 420,
                    height: 220,  // фиксированная высота для всех плашек
                    child: Container(
                      decoration: AboutStyles.cardDecoration,
                      padding: AboutStyles.sectionPadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            section['header'],
                            style: AboutStyles.cardHeader,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Text(
                                section['description'],
                                style: AboutStyles.cardDescription,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
