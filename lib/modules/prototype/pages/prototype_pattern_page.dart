import 'package:design_patterns/modules/prototype/controller/prototype_pattern_store.dart';
import 'package:design_patterns/modules/prototype/model/dart/cliente_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PrototypePatternPage extends StatefulWidget {
  const PrototypePatternPage({Key? key}) : super(key: key);

  @override
  _PrototypePatternPageState createState() => _PrototypePatternPageState();
}

class _PrototypePatternPageState extends State<PrototypePatternPage> {
  PrototypePatternStore store = PrototypePatternStore();

  @override
  void initState() {
    super.initState();

    var cli1 = ClienteModel();
    var cli2 = cli1.clone();

    //* Objetos com instâncias diferentes com o clone
    debugPrint('${cli1.hashCode}');
    debugPrint('${cli2.hashCode}');

    debugPrint('$cli1');
    debugPrint('$cli2');
    debugPrint('########################');
    cli2.telefones?.removeAt(0);
    debugPrint('$cli1');
    debugPrint('$cli2');

    // Exemplo com MobX
    store.loadCliente();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => store.fazerAniversario(),
        label: const Text('Fazer Aniversário'),
      ),
      appBar: AppBar(
        title: const Text('Prototype Pattern'),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(store.cliente!.nome),
                Text(store.cliente!.telefone),
                Text(store.cliente!.idade.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
