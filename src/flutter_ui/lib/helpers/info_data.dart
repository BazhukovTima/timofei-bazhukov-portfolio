import 'dart:convert';
import 'package:flutter/services.dart';

class InfoData {
  final String name;
  final String role;
  final String description;
  final String location;
  final List<SocialLink> social;
  final SkillsSection skills;
  final AboutSection about;
  final ExperienceSection experience;
  final List<Framework> frameworks;

  InfoData({
    required this.name,
    required this.role,
    required this.description,
    required this.location,
    required this.social,
    required this.skills,
    required this.about,
    required this.experience,
    required this.frameworks,
  });

  factory InfoData.fromJson(Map<String, dynamic> json) {
    return InfoData(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      social: (json['social'] as List<dynamic>? ?? [])
          .map((s) => SocialLink.fromJson(s))
          .toList(),
      skills: SkillsSection.fromJson(json['skills'] ?? {}),
      about: AboutSection.fromJson(json['about'] ?? {}),
      experience: ExperienceSection.fromJson(json['experience'] ?? {}),
      frameworks: (json['frameworks'] as List<dynamic>? ?? [])
          .map((f) => Framework.fromJson(f))
          .toList(),
    );
  }

  static Future<InfoData> load() async {
    final data = await rootBundle.loadString('assets/info.json');
    final jsonResult = json.decode(data) as Map<String, dynamic>;
    return InfoData.fromJson(jsonResult);
  }
}

class SocialLink {
  final String platform;
  final String url;

  SocialLink({required this.platform, required this.url});

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      platform: json['platform'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class SkillsSection {
  final String description;
  final Map<String, SkillCategory> skills;

  SkillsSection({
    required this.description,
    required this.skills,
  });

  factory SkillsSection.fromJson(Map<String, dynamic> json) {
    final skillsMap = (json['skills'] as Map<String, dynamic>? ?? {})
        .map((key, value) => MapEntry(key, SkillCategory.fromJson(value)));

    return SkillsSection(
      description: json['description'] ?? '',
      skills: skillsMap,
    );
  }
}

class SkillCategory {
  final String title;
  final List<String> skills;

  SkillCategory({
    required this.title,
    required this.skills,
  });

  factory SkillCategory.fromJson(Map<String, dynamic> json) {
    return SkillCategory(
      title: json['title'] ?? '',
      skills: List<String>.from(json['skills'] ?? []),
    );
  }
}

class AboutSection {
  final String header;
  final ExpertiseSection expertise;
  final AboutItem technicalStack;
  final AboutItem currentFocus;
  final AboutItem mobileDevelopment;
  final AboutItem softSkills;

  AboutSection({
    required this.header,
    required this.expertise,
    required this.technicalStack,
    required this.currentFocus,
    required this.mobileDevelopment,
    required this.softSkills,
  });

  factory AboutSection.fromJson(Map<String, dynamic> json) {
    return AboutSection(
      header: json['header'] ?? '',
      expertise: ExpertiseSection.fromJson(json['expertise'] ?? {}),
      technicalStack: AboutItem.fromJson(json['technicalStack'] ?? {}),
      currentFocus: AboutItem.fromJson(json['currentFocus'] ?? {}),
      mobileDevelopment: AboutItem.fromJson(json['mobileDevelopment'] ?? {}),
      softSkills: AboutItem.fromJson(json['softSkills'] ?? {}),
    );
  }
}

class ExpertiseSection {
  final String header;
  final String description;

  ExpertiseSection({
    required this.header,
    required this.description,
  });

  factory ExpertiseSection.fromJson(Map<String, dynamic> json) {
    return ExpertiseSection(
      header: json['header'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class AboutItem {
  final String header;
  final String description;

  AboutItem({
    required this.header,
    required this.description,
  });

  factory AboutItem.fromJson(Map<String, dynamic> json) {
    return AboutItem(
      header: json['header'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class ExperienceSection {
  final String overview;
  final Map<String, ExperienceProject> projects;

  ExperienceSection({
    required this.overview,
    required this.projects,
  });

  factory ExperienceSection.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> rawProjects = json['projects'] ?? {};
    final projectMap = rawProjects.map(
      (key, value) => MapEntry(key, ExperienceProject.fromJson(value)),
    );

    return ExperienceSection(
      overview: json['overview'] ?? '',
      projects: projectMap,
    );
  }
}

class ExperienceProject {
  final String company;
  final String role;
  final String period;
  final String details;
  final String technologies;

  ExperienceProject({
    required this.company,
    required this.role,
    required this.period,
    required this.details,
    required this.technologies,
  });

  factory ExperienceProject.fromJson(Map<String, dynamic> json) {
    return ExperienceProject(
      company: json['company'] ?? '',
      role: json['role'] ?? '',
      period: json['period'] ?? '',
      details: json['details'] ?? '',
      technologies: json['technologies'] ?? '',
    );
  }
}

class Framework {
  final String name;
  final String logo;

  Framework({
    required this.name,
    required this.logo,
  });

  factory Framework.fromJson(Map<String, dynamic> json) {
    return Framework(
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
    );
  }
}
