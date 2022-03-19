import 'package:design_patterns/app/modules/composite/feed/feed_page.dart';
import 'package:flutter/material.dart';

class CompositePatternPage extends StatefulWidget {
  const CompositePatternPage({Key? key}) : super(key: key);

  @override
  _CompositePatternPageState createState() => _CompositePatternPageState();
}

class _CompositePatternPageState extends State<CompositePatternPage> {
  @override
  Widget build(BuildContext context) {
    return const FeedPage();
  }
}
