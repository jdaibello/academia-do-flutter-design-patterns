import 'package:design_patterns/app/modules/stragegy/formula_one/formula_one_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormulaOneModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FormulaOneModule()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => FormulaOnePage(
        title: args.data,
      ),
    ),
  ];
}
