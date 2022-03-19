import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationConfiguration {
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    debugPrint("Handling a background message: ${message.messageId}");
  }

  Future<void> configure() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // debugPrint('Got a message whilst in the foreground!');
      debugPrint('onMessage: ${message.data}');

      // if (message.notification != null) {
      //   debugPrint('Message also contained a notification: ${message.notification}');
      // }
    });

    debugPrint('TOKEN: ${await FirebaseMessaging.instance.getToken()}');
  }
}
