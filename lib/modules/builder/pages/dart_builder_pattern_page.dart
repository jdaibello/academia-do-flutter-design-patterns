import 'package:design_patterns/modules/builder/dio/custom_dio_builder.dart';
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

    // Pure Dart
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

    // Dio
    _dioRequest();
  }

  Future<void> _dioRequest() async {
    debugPrint('###########################################################');
    debugPrint('POST');

    var resultPost = await CustomDioBuilder.instance
        .post()
        .path('https://jsonplaceholder.typicode.com/posts')
        .addHeader('Content-Type', 'application/json')
        .params()
        .data(
      {
        'title': 'Título X',
        'body': 'Body X',
        'userId': 1,
      },
    ).run();

    debugPrint('${resultPost.data}');
    debugPrint('###########################################################');

    debugPrint('GET com Query Parameters');

    var resultGet = await CustomDioBuilder.instance
        .get()
        .path('https://jsonplaceholder.typicode.com/posts')
        .params()
        .queryParameters()
        .addQueryParam('userId', 1)
        .run();

    debugPrint('${resultGet.data}');
    debugPrint('###########################################################');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builder Pattern'),
      ),
      body: const Center(
        child: Text('Veja os debugPrints do initState no console'),
      ),
    );
  }
}
