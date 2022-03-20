import 'package:flutter/material.dart';

class FormulaOnePage extends StatefulWidget {
  final String title;

  const FormulaOnePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _FormulaOnePageState createState() => _FormulaOnePageState();
}

class _FormulaOnePageState extends State<FormulaOnePage> {
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
            Text('Tela da corrida de Fórmula 1'),
          ],
        ),
      ),
    );
  }
}
