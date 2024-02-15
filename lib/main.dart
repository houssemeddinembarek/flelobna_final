import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flelobna/api/firebase_api.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/firebase_options.dart';
import 'package:flelobna/screens/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase services
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // Local Notifications Plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Android Initialization
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

  // iOS/Darwin Initialization
  const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  // General Initialization Settings
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  // Initialize local notifications
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Setting up background message handler
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  // Subscribe to topic if necessary
  await FirebaseMessaging.instance.subscribeToTopic('all');

  // Initialize GetStorage or any other necessary services
  await GetStorage.init();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FleLobna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan.withOpacity(0.4)),
        useMaterial3: true,
        iconTheme: IconThemeData(color: AppColors.blueTextColor),
      ),
      home: SplashScreen(),
    );
  }
}