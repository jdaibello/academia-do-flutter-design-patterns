import 'package:design_patterns/app/core/push_notification_strategies/strategy/i_push_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FomulaOneStrategy implements IPushStrategy {
  @override
  void execute(Map<String, dynamic> pushPayload) {
    debugPrint('########################################');
    debugPrint('########## RaceStatusStrategy ##########');
    debugPrint('########################################');

    Modular.to.pushNamed(
      '/strategy/formula-one',
      arguments: pushPayload['race_status'],
    );
  }
}
