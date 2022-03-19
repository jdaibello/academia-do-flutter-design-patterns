import 'package:design_patterns/app/modules/factory/factories/dialog_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(DialogFactory.navigatorKey);

    return MaterialApp.router(
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      title: 'Design Patterns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
