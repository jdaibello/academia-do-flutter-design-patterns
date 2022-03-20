import 'dart:convert';
import 'dart:io';

import 'package:design_patterns/app/core/push_notification_strategies/push_notification_factory.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationConfiguration {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationDetails? platformChannelSpecifics;

  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    debugPrint("Handling a background message: ${message.messageId}");
  }

  Future<void> configure() async {
    //* Flutter Local Notifications package configuration
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'push_notification_strategy',
      'push_notification_strategy_name',
      channelDescription: 'push_notification_strategy_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails();

    platformChannelSpecifics = const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    //* FCM (Firebase Cloud Messaging) package configuration
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // debugPrint('Got a message whilst in the foreground!');
      debugPrint('onMessage: ${message.data}');
      _proccessMessage(message);

      // if (message.notification != null) {
      //   debugPrint('Message also contained a notification: ${message.notification}');
      // }
    });

    debugPrint('TOKEN: ${await FirebaseMessaging.instance.getToken()}');
  }

  void _proccessMessage(RemoteMessage message) async {
    _flutterLocalNotificationShow(message);
  }

  Future<void> _flutterLocalNotificationShow(RemoteMessage message) async {
    String payload;
    if (Platform.isIOS) {
      payload = message.data["payload"]; //! Wrong, need to fix
    } else {
      payload = message.data["payload"];
    }

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {}

  void onSelectNotification(
    String? payload,
  ) {
    if (payload != null) {
      debugPrint('On notification clicked: $payload');

      //* With Dart Analyzer warning. Bad recommendation
      //* Avoid single cascade (..) in expression statements
      // PushNotificationFactory.create(jsonDecode(payload))..execute();

      //* Without Dart Analyzer warning. Good recommendation
      PushNotificationFactory.create(jsonDecode(payload)).execute();
    } else {
      throw Exception(
        """
        Mandatory "payload" field isn't defined in API request.
        Please, check your json body and try again.
        """,
      );
    }
  }
}
