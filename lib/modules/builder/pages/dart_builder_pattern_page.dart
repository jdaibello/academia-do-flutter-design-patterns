import 'package:design_patterns/modules/builder/funcionario_builder.dart';
import 'package:design_patterns/modules/builder/funcionario_builder_complexo.dart';
import 'package:design_patterns/modules/builder/model/filho_model.dart';
import 'package:flutter/material.dart';

class DartBuilderPattern extends StatefulWidget {
  const DartBuilderPattern({Key? key}) : super(key: key);

  @override
  _DartBuilderPatternState createState() => _DartBuilderPatternState();
}

class _DartBuilderPatternState extends State<DartBuilderPattern> {
  @override
  void initState() {
    super.initState();

    var funcionario1 = FuncionarioBuilder.instance
        .addFilho(
          FilhoModel(
            nome: 'Filho 2',
            idade: 2,
          ),
        )
        .nome('João Pedro')
        .idade(22)
        .profissao('Desenvolvedor')
        .addFilho(
          FilhoModel(
            nome: 'Filho 1',
            idade: 1,
          ),
        )
        .build();

    debugPrint('$funcionario1');

    var funcionario2 = FuncionarioBuilderComplexo.instance
        .nome('João')
        .idade(22)
        .profissao('Dev')
        .addFilho(
          FilhoModel(
            nome: 'Filho 1',
            idade: 1,
          ),
        )
        .build();

    debugPrint('$funcionario2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Pattern (Dart - debugPrint)'),
      ),
      body: Container(),
    );
  }
}
