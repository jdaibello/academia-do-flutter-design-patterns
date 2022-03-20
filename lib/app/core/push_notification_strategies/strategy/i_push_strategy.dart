abstract class IPushStrategy {
  final String appBarTitle;
  final String bodyText;

  IPushStrategy({
    required this.appBarTitle,
    required this.bodyText,
  });

  void execute(Map<String, dynamic> pushPayload);
}
