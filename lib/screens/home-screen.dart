import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/introduction-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(
          top: size.height * 0.08,
          left: size.width * 0.04,
          right: size.width * 0.04,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [Colors.cyan, Colors.blueGrey],
            colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.06,
            horizontal: size.width * 0.04,
          ),
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withOpacity(0.3),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              // color: Color(0xFF192E5B),
              color: AppColors.whiteFlue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.3),
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.4,
                        alignment: Alignment.center,
                        child: Text(
                          "تحت اشراف ",
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blueTextColor,
                            // decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: size.width * 0.34,
                        height: size.height * 0.003,
                        decoration: BoxDecoration(
                          color: AppColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "الموجه العام لمادة اللغة الفرنسية ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "أ/ أنور الكندري ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "الموجه الفني الأول لمادة اللغة الفرنسية",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "د/ سعود الشمري",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                      ),
                      Text(
                        "( منطقة الأحمدي التعليمية )",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "الموجهة الفنية لمادة اللغة الفرنسية",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "أ/ رفا القناعي",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        " ( منطقة الأحمدي التعليمية )",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "رئيس قسم اللغة الفرنسية ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "أ/روضة حمادي بوجنيح ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        " ( ثانوية لبنى بنت الحارث )",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "مديرة المدرسة",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "أ/ منيره ابراهيم ابوحمره ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                      ),
                      Text(
                        "( ثانوية لبنى بنت الحارث ) ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            // Get.to(() => VideoScreen(
                            //   videoAssets: [
                            //     'assets/video/video11.mp4',
                            //   ],
                            // ));
                          },
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => IntroductionScreen());
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Suivant',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: size.width * 0.01),
                                Icon(Icons.arrow_forward,
                                    size: 15, color: Colors.white),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
