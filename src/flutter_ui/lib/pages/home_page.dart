import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../widgets/home/responsive_layout.dart';
import '../styles/home_styles.dart';

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
          padding: HomeStyles.contentPadding(context),
          child: Center(
            child: SingleChildScrollView(
              child: ResponsiveLayout(info: info),
            ),
          ),
        );
      },
    );
  }
}
