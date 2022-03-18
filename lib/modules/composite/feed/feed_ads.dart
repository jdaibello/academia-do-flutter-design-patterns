import 'package:design_patterns/modules/composite/feed/i_feed.dart';
import 'package:flutter/material.dart';

class FeedAds implements IFeed {
  @override
  Widget render() {
    return Container(
      color: Colors.blueAccent,
      width: double.infinity,
      height: 100,
      child: const Center(
        child: Text(
          'ANÚNCIO CHATO',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget renderBottom() {
    throw UnimplementedError();
  }

  @override
  Widget renderContent() {
    throw UnimplementedError();
  }
}
