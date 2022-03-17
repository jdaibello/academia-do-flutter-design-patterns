import 'package:design_patterns/home_page.dart';
import 'package:design_patterns/modules/builder/pages/dart_builder_pattern_page.dart';
import 'package:design_patterns/modules/singleton/pages/singleton_pattern_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/singleton': (_) => const SingletonPattern(),
        '/builder': (_) => const DartBuilderPattern(),
      },
    );
  }
}
