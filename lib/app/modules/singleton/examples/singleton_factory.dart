import 'dart:math';

class SingletonFactory {
  SingletonFactory._();

  static SingletonFactory? _instance;
  int id = Random().nextInt(100);

  factory SingletonFactory() {
    _instance ??= SingletonFactory._();
    return _instance!;
  }
}
