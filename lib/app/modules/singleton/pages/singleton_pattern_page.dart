import 'package:design_patterns/app/database/connection.dart';
import 'package:flutter/material.dart';

class SingletonPattern extends StatefulWidget {
  const SingletonPattern({Key? key}) : super(key: key);

  @override
  _SingletonPatternState createState() => _SingletonPatternState();
}

class _SingletonPatternState extends State<SingletonPattern> {
  List<String> nomes = [];

  @override
  void initState() {
    super.initState();
    buscarNomes();
    // int i = 0;
    // while (i < 10) {
    //   // debugPrint('Valor do Singleton: ${SingletonRaiz.instance.id}');
    //   var inst = SingletonFactory();
    //   debugPrint('Valor do Singleton: ${inst.id}');
    //   if (i == 0) {
    //     inst.id = 20;
    //   }
    //   i++;
    // }
  }

  @override
  void dispose() {
    Connection.instance.closeConnection();
    super.dispose();
  }

  Future<void> buscarNomes() async {
    var db = await Connection.instance.db;
    var result = await db.rawQuery("SELECT * FROM teste");
    setState(() {
      nomes = result.map<String>((t) => t['nome'] as String).toList();
    });
    debugPrint('$nomes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singleton'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var db = await Connection.instance.db;
          await db.rawInsert('INSERT INTO teste VALUES("Adicionado pelo FAB")');
          buscarNomes();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: nomes.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(nomes[index]),
        ),
      ),
    );
  }
}
