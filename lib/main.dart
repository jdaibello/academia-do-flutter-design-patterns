import 'package:design_patterns/home_page.dart';
import 'package:design_patterns/modules/adapter/page/adapter_pattern_page.dart';
import 'package:design_patterns/modules/builder/pages/dart_builder_pattern_page.dart';
import 'package:design_patterns/modules/composite/page/composite_pattern_page.dart';
import 'package:design_patterns/modules/factory/factories/dialog_factory.dart';
import 'package:design_patterns/modules/factory/pages/factory_pattern_page.dart';
import 'package:design_patterns/modules/prototype/pages/prototype_pattern_page.dart';
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
      navigatorKey: DialogFactory.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/singleton': (_) => const SingletonPattern(),
        '/builder': (_) => const DartBuilderPattern(),
        '/prototype': (_) => const PrototypePatternPage(),
        '/factory': (_) => const FactoryPatternPage(),
        '/adapter': (_) => const AdapterPatternPage(),
        '/composite': (_) => const CompositePatternPage(),
      },
    );
  }
}
