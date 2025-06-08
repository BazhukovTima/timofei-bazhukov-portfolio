import 'package:flutter/material.dart';
import '../helpers/info_data.dart';
import '../widgets/home/responsive_layout.dart';
import '../styles/home_styles.dart';

class HomePageContent extends StatelessWidget {
  final InfoData info;

  const HomePageContent({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomeStyles.contentPadding(context),
      child: Center(
        child: SingleChildScrollView(
          child: ResponsiveLayout(info: info),
        ),
      ),
    );
  }
}
