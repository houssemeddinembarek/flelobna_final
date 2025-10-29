import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flelobna/api/notification_service.dart';
import 'package:flelobna/bindings/initial_binding.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/firebase_options.dart';
import 'package:flelobna/screens/splash-screen.dart';
import 'package:flutter/material.dart';
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
  
  // Initialize GetStorage
  await GetStorage.init();

  // Setup Firebase Messaging background handler
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  // Initialize notification service
  final notificationService = NotificationService();
  await notificationService.initialize();

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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.GreeFonce),
        useMaterial3: true,
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(color: AppColors.blueTextColor),
      ),
      initialBinding: InitialBinding(),
      home: SplashScreen(),
    );
  }
}