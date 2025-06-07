import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui/helpers/info_data.dart';

class TestAssetBundle extends CachingAssetBundle {
  final Map<String, String> _mockData = {};

  void addMockJson(String key, String value) {
    _mockData[key] = value;
  }

  @override
  Future<ByteData> load(String key) async {
    if (_mockData.containsKey(key)) {
      final encoded = utf8.encode(_mockData[key]!);
      return ByteData.view(Uint8List.fromList(encoded).buffer);
    }
    throw FlutterError('Key "$key" not found in mock asset bundle.');
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (_mockData.containsKey(key)) {
      return _mockData[key]!;
    }
    throw FlutterError('Key "$key" not found in mock asset bundle.');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('InfoData.load parses JSON correctly', () async {
    const mockJson = {
      "name": "John Doe",
      "role": "Developer",
      "description": "An experienced Flutter dev",
      "location": "Earth",
      "social": [
        {"platform": "GitHub", "url": "https://github.com/john"},
      ],
      "skills": {
        "description": "My skills",
        "skills": {
          "frontend": {
            "title": "Frontend",
            "skills": ["Flutter", "React"],
          },
        },
      },
      "about": {
        "header": "About Me",
        "expertise": {"header": "Expertise", "description": "Mobile and Web"},
        "technicalStack": {"header": "Stack", "description": "Flutter, Dart"},
        "currentFocus": {
          "header": "Focus",
          "description": "Clean Architecture",
        },
        "mobileDevelopment": {"header": "Mobile", "description": "Android/iOS"},
        "softSkills": {"header": "Soft Skills", "description": "Communication"},
      },
      "experience": {
        "overview": "Years of experience",
        "projects": {
          "proj1": {
            "company": "Tech Inc",
            "role": "Engineer",
            "period": "2020-2022",
            "details": "Worked on mobile apps",
            "technologies": "Flutter, Firebase",
          },
        },
      },
      "frameworks": [
        {"name": "Flutter", "logo": "flutter_logo.png"},
      ],
    };

    final encodedJson = jsonEncode(mockJson);

    final testAssetBundle = TestAssetBundle();
    testAssetBundle.addMockJson('assets/info.json', encodedJson);

    ServicesBinding.instance!.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
      (ByteData? message) async {
        final key = utf8.decoder.convert(message!.buffer.asUint8List());
        try {
          return (await testAssetBundle.load(key)).buffer.asByteData();
        } catch (_) {
          return null;
        }
      },
    );

    final data = await InfoData.load();

    expect(data.name, 'John Doe');
    expect(data.social.first.platform, 'GitHub');
    expect(data.skills.skills['frontend']!.skills, contains('Flutter'));
    expect(data.frameworks.first.name, 'Flutter');
  });
}
