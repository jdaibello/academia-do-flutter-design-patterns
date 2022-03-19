import 'package:design_patterns/app/modules/factory/factories/dialog_action.dart';
import 'package:design_patterns/app/modules/factory/factories/dialog_factory.dart';
import 'package:flutter/material.dart';

class FactoryPatternPage extends StatefulWidget {
  const FactoryPatternPage({Key? key}) : super(key: key);

  @override
  State<FactoryPatternPage> createState() => _FactoryPatternPageState();
}

class _FactoryPatternPageState extends State<FactoryPatternPage> {
  void _openDialog() {
    DialogFactory.showAlertDialog(
      title: const Text('Título 1'),
      content: const Text('Conteúdo X'),
      forceIos: true,
      actions: [
        DialogAction(
          child: const Text('SIM'),
          onPressed: () => debugPrint('SIM'),
        ),
        DialogAction(
          child: const Text('NÃO'),
          onPressed: () => debugPrint('NÃO'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Pattern'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openDialog,
        label: const Text(
          'Abrir Dialog',
        ),
      ),
      body: Container(),
    );
  }
}
