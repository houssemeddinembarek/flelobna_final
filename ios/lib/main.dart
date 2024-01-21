import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testsdk/pages/home_page.dart';
import 'package:testsdk/pages/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key,});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FleLobna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan.withOpacity(0.4)),
        useMaterial3: true,

      ),
      home: SplashScreen(),
    );
  }
}


