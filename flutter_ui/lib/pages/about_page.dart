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

    return SingleChildScrollView(
      padding: AboutStyles.contentPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AboutStyles.maxContentWidth(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AboutStyles.aboutHeaderText, style: AboutStyles.mainHeader(context)),
              SizedBox(height: AboutStyles.verticalSpacingSmall(context)),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: AboutStyles.maxExpertiseTextWidth(context)),
                child: Text(
                  expertiseDescription,
                  style: AboutStyles.expertiseDescription(context),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: AboutStyles.verticalSpacingLarge(context)),
              Wrap(
                spacing: AboutStyles.wrapSpacing(context),
                runSpacing: AboutStyles.wrapRunSpacing(context),
                alignment: AboutStyles.wrapAlignment,
                children: sections.map<Widget>((section) {
                  return SizedBox(
                    width: AboutStyles.cardWidth(context),
                    // убираем фиксированную высоту, чтобы карточка подстраивалась под текст
                    child: Container(
                      decoration: AboutStyles.cardDecoration,
                      padding: AboutStyles.sectionPadding(context),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            section['header'],
                            style: AboutStyles.cardHeader(context),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            section['description'],
                            style: AboutStyles.cardDescription(context),
                            textAlign: TextAlign.center,
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
