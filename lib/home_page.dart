import 'package:flutter/material.dart';

enum PopupMenuPages {
  singletonPattern,
  builderPattern,
  prototypePattern,
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          PopupMenuButton<PopupMenuPages>(
            tooltip: 'Selecione um item',
            onSelected: (PopupMenuPages valueSelected) {
              switch (valueSelected) {
                case PopupMenuPages.singletonPattern:
                  Navigator.of(context).pushNamed('/singleton');
                  break;
                case PopupMenuPages.builderPattern:
                  Navigator.of(context).pushNamed('/builder');
                  break;
                case PopupMenuPages.prototypePattern:
                  Navigator.of(context).pushNamed('/prototype');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<PopupMenuPages>>[
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.singletonPattern,
                  child: Text('Singleton Pattern'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.builderPattern,
                  child: Text('Builder Pattern'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.prototypePattern,
                  child: Text('Prototype Pattern'),
                ),
              ];
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Selecione um pattern no menu popup'),
      ),
    );
  }
}
