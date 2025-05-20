// lib/app.dart
import 'package:flutter/material.dart';
import 'router.dart'; // импорт роутера

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // подключаем go_router
      title: 'Timofei Bazhukov Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
