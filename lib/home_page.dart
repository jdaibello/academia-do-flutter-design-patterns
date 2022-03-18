import 'package:flutter/material.dart';

enum PopupMenuPages {
  singletonPattern,
  builderPattern,
  prototypePattern,
  factoryPattern,
  adapterPattern,
  compositePattern,
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
                case PopupMenuPages.factoryPattern:
                  Navigator.of(context).pushNamed('/factory');
                  break;
                case PopupMenuPages.adapterPattern:
                  Navigator.of(context).pushNamed('/adapter');
                  break;
                case PopupMenuPages.compositePattern:
                  Navigator.of(context).pushNamed('/composite');
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
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.factoryPattern,
                  child: Text('Factory Pattern'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.adapterPattern,
                  child: Text('Adapter Pattern'),
                ),
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.compositePattern,
                  child: Text('Composite Pattern'),
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
