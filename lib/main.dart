import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:template_provider_mvvm/app.dart';
import 'package:template_provider_mvvm/core/enums/env.dart';
import 'package:template_provider_mvvm/core/others/logger_customization/custom_logger.dart';
import 'package:template_provider_mvvm/firebase_options.dart';
import 'package:template_provider_mvvm/locator.dart';

Future<void> main() async {
  final log = CustomLogger(className: 'main');
  try {
    log.i('Testing info logs');
    log.d('Testing debug logs');
    log.e('Testing error logs');
    log.wtf('Testing WTF logs');
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await setupLocator(Env.production);
    runApp(const MyApp(title: 'App Name'));
  } catch (e) {
    log.e("$e");
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final log = CustomLogger(className: 'main');
  await Firebase.initializeApp();
  log.d("Handling a background message: ${message.messageId}");
}
