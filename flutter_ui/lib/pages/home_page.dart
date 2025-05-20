import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../widgets/social_links.dart';

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
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Основной блок с аватаром и текстом
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Аватарка
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('profile-no-bg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Текстовый блок
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            info.role,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            info.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            info.location,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          SocialLinks(social: info.social),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
