import 'package:design_patterns/app/modules/stragegy/football/bloc/football_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FootballPage extends StatefulWidget {
  final String title;

  const FootballPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends ModularState<FootballPage, FootballBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Tela da partida de Futebol'),
          ],
        ),
      ),
    );
  }
}
