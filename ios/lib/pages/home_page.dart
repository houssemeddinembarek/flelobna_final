import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testsdk/pages/navigation_page.dart';
import 'package:testsdk/pages/video_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  });

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
          colors: [Colors.cyan, Colors.blueGrey],
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.01,
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
            color: Color(0xFF192E5B),
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
                      width: size.width * 0.22,
                      child: Text(
                        "تحت اشراف ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          letterSpacing: size.width * 0.005,
                          color: Colors.white,
                          // decoration: TextDecoration.underline,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.22,
                      height: size.height * 0.003,
                      decoration: BoxDecoration(color: Colors.white),
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
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "أ/ أنور الكندري ",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
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
                      "الموجه الفني الأول لمادة اللغة الفرنسية ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "( منطقة الأحمدي التعليمية )   ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "د/ سعود الشمري ",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
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
                      "الموجهة الفنية لمادة اللغة الفرنسية ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      " ( منطقة الأحمدي التعليمية )",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "أ/ رفا القناعي ",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
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
                      "رئيس قسم اللغة الفرنسية ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      " ( ثانوية لبنى بنت الحارث  )",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "أ/روضة حمادي بوجنيح ",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
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
                      "مديرة المدرسة",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "أ/ منيره ابراهيم ابو حمره ",
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "( ثانوية لبنى بنت الحارث  ) ",
                      style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.005,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 3,
                          ),
                        ],
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
                          Get.to(() => VideoScreen(
                                videoAssets: [
                                  'assets/video/video11.mp4',
                                ],
                              ));
                        },
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan.withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.offAll(NavigationPage());
                          },
                          child: Row(
                            children: [
                              Text('Suivant'),
                              SizedBox(width: size.width * 0.01),
                              Icon(Icons.arrow_forward, size: 15),
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
    ));
  }
}
