import 'package:design_patterns/app/core/push_notification_strategies/strategy/football_strategy.dart';
import 'package:design_patterns/app/core/push_notification_strategies/strategy/formula_one_strategy.dart';
import 'package:design_patterns/app/core/push_notification_strategies/strategy/i_push_strategy.dart';
import 'package:flutter/material.dart';

class PushNotificationFactory {
  String? title;
  String? text;

  Map<String, dynamic> pushPayload;
  IPushStrategy? strategy;

  PushNotificationFactory.create(this.pushPayload) {
    try {
      switch (pushPayload['type']) {
        case 'football':
          strategy = FootballStrategy();
          title = strategy!.appBarTitle;
          text = strategy!.bodyText;
          break;
        case 'formula-one':
          strategy = FomulaOneStrategy();
          title = strategy!.appBarTitle;
          text = strategy!.bodyText;
          break;
        default:
          title = 'Não encontrado';
          text = 'Layout de página 404 a ser construído';
          throw Exception('Estratégia não implementada');
      }
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  String get homePageTitle => title!;
  String get homePageTexto => text!;

  void execute() {
    strategy!.execute(pushPayload);
  }
}
