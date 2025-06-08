import 'package:flutter_ui/helpers/info_data.dart';

InfoData createMockInfoData() {
  return InfoData(
    name: 'John Doe',
    role: 'Flutter Developer',
    description: 'Experienced developer with passion for Flutter.',
    location: 'Earth',
    social: [
      SocialLink(platform: 'GitHub', url: 'https://github.com/johndoe'),
      SocialLink(platform: 'LinkedIn', url: 'https://linkedin.com/in/johndoe'),
    ],
    skills: SkillsSection(
      description: 'My main skills',
      skills: {
        'programming': SkillCategory(
          title: 'Programming Languages',
          skills: ['Dart', 'JavaScript', 'Python'],
        ),
      },
    ),
    about: AboutSection(
      header: 'About Me',
      expertise: ExpertiseSection(
        header: 'Expertise',
        description: 'Flutter, Dart, Mobile Development',
      ),
      technicalStack: AboutItem(
        header: 'Tech Stack',
        description: 'Flutter, Firebase, REST APIs',
      ),
      currentFocus: AboutItem(
        header: 'Current Focus',
        description: 'Building cross-platform apps',
      ),
      mobileDevelopment: AboutItem(
        header: 'Mobile Development',
        description: 'Experience with Android and iOS',
      ),
      softSkills: AboutItem(
        header: 'Soft Skills',
        description: 'Teamwork, Communication',
      ),
    ),
    experience: ExperienceSection(
      overview: 'Overview of my experience',
      projects: {
        'Project A': ExperienceProject(
          company: 'Company A',
          role: 'Developer',
          period: '2020 - 2021',
          details: 'Developed awesome apps',
          technologies: 'Flutter, Firebase',
        ),
        'Project B': ExperienceProject(
          company: 'Company B',
          role: 'Senior Developer',
          period: '2021 - Present',
          details: 'Led mobile development team',
          technologies: 'Flutter, GraphQL',
        ),
      },
    ),
    frameworks: [
      Framework(name: 'Flutter', logo: 'assets/flutter_logo.png'),
      Framework(name: 'Firebase', logo: 'assets/firebase_logo.png'),
    ],
  );
}
