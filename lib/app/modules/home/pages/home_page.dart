import 'package:design_patterns/app/core/push_notification_strategies/strategy/i_push_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum PopupMenuPages {
  singletonPattern,
  builderPattern,
  prototypePattern,
  factoryPattern,
  adapterPattern,
  compositePattern,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Try to save _iPushStrategy appBarTitle and bodyText with GetIt
  IPushStrategy? _iPushStrategy;

  late String title;
  late String body;

  @override
  void initState() {
    super.initState();
    _buildPage();
  }

  void _buildPage() {
    title = _iPushStrategy!.appBarTitle;
    body = _iPushStrategy!.bodyText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Try to do a setState when a notification message is clicked to update this title
        title: _iPushStrategy != null ? Text(title) : const Text('Home Page'),
        actions: [
          PopupMenuButton<PopupMenuPages>(
            tooltip: 'Selecione um item',
            onSelected: (PopupMenuPages valueSelected) {
              switch (valueSelected) {
                case PopupMenuPages.singletonPattern:
                  Modular.to.pushNamed('/singleton');
                  break;
                case PopupMenuPages.builderPattern:
                  Modular.to.pushNamed('/builder');
                  break;
                case PopupMenuPages.prototypePattern:
                  Modular.to.pushNamed('/prototype');
                  break;
                case PopupMenuPages.factoryPattern:
                  Modular.to.pushNamed('/factory');
                  break;
                case PopupMenuPages.adapterPattern:
                  Modular.to.pushNamed('/adapter');
                  break;
                case PopupMenuPages.compositePattern:
                  Modular.to.pushNamed('/composite');
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
      body: Center(
        // TODO: Try to do a setState when a notification message is clicked to update this text
        child: _iPushStrategy != null
            ? Text(title)
            : const Text('Selecione um pattern no menu popup'),
      ),
    );
  }
}
