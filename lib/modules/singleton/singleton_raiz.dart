import 'dart:math';

class SingletonRaiz {
  SingletonRaiz._(); // Private constructor

  static SingletonRaiz? _instance;
  int id = Random().nextInt(100);

  static get instance {
    _instance ??= SingletonRaiz._();
    return _instance;
  }
}
