import 'package:design_patterns/app/modules/composite/feed/i_feed.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Feed implements IFeed {
  final String text;
  final DateTime date;

  Feed({required this.text}) : date = DateTime.now();

  @override
  Widget render() {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: renderContent(),
    );
  }

  @override
  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        renderBottom(),
      ],
    );
  }

  //* Pode deixar o renderBottom privado
  @override
  Widget renderBottom() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Enviado em ${DateFormat('dd/MM/yyy').format(date)}',
            style: const TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
