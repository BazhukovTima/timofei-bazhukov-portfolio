import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../widgets/social_links.dart';
import '../styles/home_styles.dart';
import '../styles/colors.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  late Future<InfoData> _infoDataFuture;

  @override
  void initState() {
    super.initState();
    _infoDataFuture = InfoData.load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InfoData>(
      future: _infoDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Ошибка загрузки данных: ${snapshot.error}'));
        }
        final info = snapshot.data!;
        return Padding(
          padding: HomeStyles.contentPadding,
          child: Center(
            child: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 900;
                  if (isNarrow) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: HomeStyles.avatarSizeSmall,
                          height: HomeStyles.avatarSizeSmall,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryDark,
                              width: 3,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('profile-no-bg.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: HomeStyles.maxTextWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                info.name,
                                style: HomeStyles.nameTextStyle(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                info.role,
                                style: HomeStyles.roleTextStyle(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                info.description,
                                style: HomeStyles.descriptionTextStyle(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                info.location,
                                style: HomeStyles.descriptionTextStyle(context),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              SocialLinks(social: info.social),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center, // <-- Центрируем по вертикали
                        children: [
                          Container(
                            width: HomeStyles.avatarSize,
                            height: HomeStyles.avatarSize,
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primaryDark,
                                width: 3,
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/profile-no-bg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: HomeStyles.horizontalSpacing),
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: HomeStyles.maxTextWidth),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min, // чтобы не растягиваться по вертикали
                                children: [
                                  Text(info.name, style: HomeStyles.nameTextStyle(context)),
                                  const SizedBox(height: 8),
                                  Text(info.role, style: HomeStyles.roleTextStyle(context)),
                                  const SizedBox(height: 16),
                                  Text(info.description, style: HomeStyles.descriptionTextStyle(context)),
                                  const SizedBox(height: 8),
                                  Text(info.location, style: HomeStyles.descriptionTextStyle(context)),
                                  const SizedBox(height: 16),
                                  SocialLinks(social: info.social),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
