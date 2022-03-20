import 'package:design_patterns/app/modules/stragegy/football/football_module.dart';
import 'package:design_patterns/app/modules/stragegy/formula_one/formula_one_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StrategyModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/football', module: FootballModule()),
    ModuleRoute('/formula-one', module: FormulaOneModule()),
  ];
}
