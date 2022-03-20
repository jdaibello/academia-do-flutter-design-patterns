import 'package:design_patterns/app/core/push_notification_strategies/strategy/football_strategy.dart';
import 'package:design_patterns/app/core/push_notification_strategies/strategy/formula_one_strategy.dart';
import 'package:design_patterns/app/core/push_notification_strategies/strategy/i_push_strategy.dart';
import 'package:flutter/material.dart';

class PushNotificationFactory {
  Map<String, dynamic> pushPayload;
  IPushStrategy? strategy;

  PushNotificationFactory.create(this.pushPayload) {
    try {
      switch (pushPayload['type']) {
        case 'football':
          strategy = FootballStrategy();
          break;
        case 'formula-one':
          strategy = FomulaOneStrategy();
          break;
        default:
          throw Exception('Estratégia não implementada');
      }
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  void execute() {
    strategy!.execute(pushPayload);
  }
}
