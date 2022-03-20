import 'package:design_patterns/app/core/push_notification_strategies/strategy/i_push_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FootballStrategy implements IPushStrategy {
  @override
  void execute(Map<String, dynamic> pushPayload) {
    debugPrint('########################################');
    debugPrint('########## MatchEventStrategy ##########');
    debugPrint('########################################');

    Modular.to.pushNamed(
      '/strategy/football',
      arguments: pushPayload['match_event'],
    );
  }
}
