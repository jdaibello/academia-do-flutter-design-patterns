import 'dart:convert';

import 'package:design_patterns/modules/adapter/model/endereco_model.dart';
import 'package:design_patterns/modules/adapter/xml2_json_transform.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';

class AdapterPatternPage extends StatefulWidget {
  const AdapterPatternPage({Key? key}) : super(key: key);

  @override
  _AdapterPatternPageState createState() => _AdapterPatternPageState();
}

class _AdapterPatternPageState extends State<AdapterPatternPage> {
  @override
  void initState() {
    super.initState();
    _getEndereco();
  }

  Future<void> _getEndereco() async {
    var endereco = await Dio()
        .get('https://viacep.com.br/ws/01001000/json/')
        .then((res) => EnderecoModel.fromJson(res.data));

    debugPrint(endereco.toString());
    debugPrint('runtimeType: ${endereco.runtimeType}');

    debugPrint('##############################');
    debugPrint('XML');

    var res = await Dio()
        .get('https://viacep.com.br/ws/01001000/xml/')
        //* Com Adapter
        // .then((res) => Xml2JsonAdapter.adapter(res.data))
        // Sem Adapter
        .then(
          (res) {
            var xmlParser = Xml2Json();
            xmlParser.parse(res.data);
            return xmlParser.toParker();
          },
        )
        .then((res) => json.decode(res))
        .then((res) => EnderecoModel.fromJson(res['xmlcep']));

    debugPrint('$res');
    debugPrint('runtimeType: ${res.runtimeType}');

    //* Com Xml2JsonTransform
    debugPrint('##############################');
    debugPrint('XML por Transform');

    var dio = Dio();
    dio.transformer = Xml2JsonTransform();
    var res2 = await dio
        .get('https://viacep.com.br/ws/01001000/xml/')
        .then((res) => EnderecoModel.fromJson(res.data['xmlcep']));

    debugPrint('$res2');
    debugPrint('runtimeType: ${res2.runtimeType}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adapter Pattern'),
      ),
      body: const SizedBox.shrink(),
    );
  }
}
