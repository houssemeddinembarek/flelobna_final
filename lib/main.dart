import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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