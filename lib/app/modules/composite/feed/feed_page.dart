import 'package:design_patterns/app/modules/composite/feed/feed.dart';
import 'package:design_patterns/app/modules/composite/feed/feed_ads.dart';
import 'package:design_patterns/app/modules/composite/feed/feed_image.dart';
import 'package:design_patterns/app/modules/composite/feed/feed_youtube.dart';
import 'package:design_patterns/app/modules/composite/feed/i_feed.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<IFeed> feed = [];

  @override
  void initState() {
    super.initState();
    feed.add(Feed(text: 'Enviando mensagem de texto'));
    feed.add(
      FeedImage(
        text: 'Enviando mensagem de texto com imagem',
        url:
            'https://i.pinimg.com/originals/2c/80/fa/2c80fa1128ae7769a9362596346ba9d8.jpg',
      ),
    );
    feed.add(Feed(text: 'Enviando mensagem de texto 12'));
    feed.add(FeedAds());
    feed.add(
      FeedYoutube(
        text: 'Enviando mensagem de texto com vídeo do YouTube',
        videoId: 'WSRn9G66xwg',
      ),
    );
    feed.add(Feed(text: 'Enviando mensagem de texto 23'));
    feed.add(FeedAds());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: ListView.builder(
        itemCount: feed.length,
        itemBuilder: (context, index) => feed[index].render(),
      ),
    );
  }
}
