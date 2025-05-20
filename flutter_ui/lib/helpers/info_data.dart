import 'dart:convert';
import 'package:flutter/services.dart';

class InfoData {
  final String name;
  final String role;
  final String description;
  final String location;
  final List<SocialLink> social;

  InfoData({
    required this.name,
    required this.role,
    required this.description,
    required this.location,
    required this.social,
  });

  factory InfoData.fromJson(Map<String, dynamic> json) {
    return InfoData(
      name: json['name'],
      role: json['role'],
      description: json['description'],
      location: json['location'],
      social: (json['social'] as List)
          .map((s) => SocialLink.fromJson(s))
          .toList(),
    );
  }

  static Future<InfoData> load() async {
    final data = await rootBundle.loadString('info.json');
    final jsonResult = json.decode(data);
    return InfoData.fromJson(jsonResult);
  }
}

class SocialLink {
  final String platform;
  final String url;

  SocialLink({required this.platform, required this.url});

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      platform: json['platform'],
      url: json['url'],
    );
  }
}
