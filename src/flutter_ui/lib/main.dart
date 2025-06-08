import 'package:flutter/material.dart';
import 'package:flutter_ui/helpers/info_data.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final infoData = await InfoData.load();
  runApp(MyApp(infoData: infoData));
}
