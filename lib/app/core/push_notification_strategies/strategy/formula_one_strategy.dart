import 'package:design_patterns/app/core/push_notification_strategies/strategy/i_push_strategy.dart';
import 'package:flutter/material.dart';

class FomulaOneStrategy implements IPushStrategy {
  @override
  void execute(Map<String, dynamic> pushPayload) {
    debugPrint('########################################');
    debugPrint('########## RaceStatusStrategy ##########');
    debugPrint('########################################');
  }

  @override
  String get appBarTitle => 'Tela da Corrida';

  @override
  String get bodyText => 'Layout a ser construído';
}
