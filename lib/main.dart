import 'package:design_patterns/app/app_module.dart';
import 'package:design_patterns/app/app_widget.dart';
import 'package:design_patterns/app/core/push_notification_configuration.dart';
import 'package:design_patterns/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(
    PushNotificationConfiguration.firebaseMessagingBackgroundHandler,
  );

  PushNotificationConfiguration().configure();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
