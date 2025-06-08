import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../styles/about_styles.dart';

class AboutPageContent extends StatelessWidget {
  final InfoData info;

  const AboutPageContent({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final aboutData = info.about;

    final expertiseDescription = aboutData.expertise.description;

    final sections = [
      aboutData.technicalStack,
      aboutData.currentFocus,
      aboutData.mobileDevelopment,
      aboutData.softSkills,
    ];

    return SingleChildScrollView(
      padding: AboutStyles.contentPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: AboutStyles.maxContentWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AboutStyles.aboutHeaderText,
                style: AboutStyles.mainHeader(context),
              ),
              SizedBox(height: AboutStyles.verticalSpacingSmall(context)),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: AboutStyles.maxExpertiseTextWidth(context),
                ),
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
                children:
                    sections.map<Widget>((section) {
                      return SizedBox(
                        width: AboutStyles.cardWidth(context),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: AboutStyles.cardHeight(context),
                          ),
                          decoration: AboutStyles.cardDecoration,
                          padding: AboutStyles.sectionPadding(context),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  section.header,
                                  style: AboutStyles.cardHeader(context),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                section.description,
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
