import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testsdk/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key? key,
  });

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
    // if (box.read('auth') != null) {
    //   Get.off(HomePage());
    //   print(box.read('auth'));
    // } else {
    //   Get.offAll(LoginScreen());
    // }
    Get.offAll(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.cyan, Colors.blueGrey],
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.width * 0.6,
                width: size.width * 0.6,
                child: Image.asset(
                  'assets/images/logosbg.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'FleLobna',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: size.width * 0.005,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0.1, 0.1),
                      blurRadius: 3,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
