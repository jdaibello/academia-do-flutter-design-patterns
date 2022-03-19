import 'package:design_patterns/app/modules/adapter/page/adapter_pattern_page.dart';
import 'package:design_patterns/app/modules/builder/pages/dart_builder_pattern_page.dart';
import 'package:design_patterns/app/modules/composite/page/composite_pattern_page.dart';
import 'package:design_patterns/app/modules/factory/pages/factory_pattern_page.dart';
import 'package:design_patterns/app/modules/home/pages/home_page.dart';
import 'package:design_patterns/app/modules/prototype/pages/prototype_pattern_page.dart';
import 'package:design_patterns/app/modules/singleton/pages/singleton_pattern_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(),
        ),
        ChildRoute(
          '/adapter',
          child: (_, args) => const AdapterPatternPage(),
        ),
        ChildRoute(
          '/builder',
          child: (_, args) => const DartBuilderPattern(),
        ),
        ChildRoute(
          '/composite',
          child: (_, args) => const CompositePatternPage(),
        ),
        ChildRoute(
          '/factory',
          child: (_, args) => const FactoryPatternPage(),
        ),
        ChildRoute(
          '/prototype',
          child: (_, args) => const PrototypePatternPage(),
        ),
        ChildRoute(
          '/singleton',
          child: (_, args) => const SingletonPattern(),
        ),
      ];
}
