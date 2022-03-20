import 'package:design_patterns/app/modules/stragegy/football/bloc/football_bloc.dart';
import 'package:design_patterns/app/modules/stragegy/football/football_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FootballModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FootballBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => FootballPage(
        title: args.data,
      ),
    ),
  ];
}
