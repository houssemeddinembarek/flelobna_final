import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/auth/login_screen.dart';
import 'package:flelobna/screens/navigation_screen.dart';
import 'package:flelobna/services/app_update_service.dart';
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
  final AppUpdateService _updateService = AppUpdateService();

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Wait for splash animation
    await Future.delayed(Duration(milliseconds: 3000), () {});
    
    // Check for app updates
    if (mounted) {
      await _updateService.checkForUpdate(context);
    }
    
    // Navigate based on login status
    await Future.delayed(Duration(milliseconds: 500), () {});
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
                colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logosFL.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  'FleLobna',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
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
