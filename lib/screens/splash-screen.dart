import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/auth/login_screen.dart';
import 'package:flelobna/screens/settings/home-screen.dart';
import 'package:flelobna/screens/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    _navigateToHome();
    super.initState();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});
    // Get.offAll(HomeScreen());
    if (GetStorage().read('email') != null) {
      Get.offAll(NavigationScreen());
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // colors: [Colors.cyan, Colors.blueGrey],
                colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.width * 0.6,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logosFL.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // SizedBox(
                //   height: size.height * 0.02,
                // ),
                // Text(
                //   'FleLobna',
                //   style: TextStyle(
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: size.width * 0.005,
                //     shadows: [
                //       Shadow(
                //         color: Colors.black,
                //         offset: Offset(0.1, 0.1),
                //         blurRadius: 3,
                //       ),
                //     ],
                //     color: AppColors.blueTextColor,
                //   ),
                // )
              ],
            )));
  }
}
