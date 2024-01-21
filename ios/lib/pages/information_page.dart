import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  InformationPage({
    Key? key,
  });



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.06,
            horizontal: size.width * 0.04,
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
              vertical: size.height * 0.02,
              horizontal: size.width * 0.02,
            ),
            decoration: BoxDecoration(
              color: Colors.white54,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(
                  width: size.width * 0.9,
                  alignment: Alignment.center,
                  child: Text(
                    "تحت اشراف ",
                    style: TextStyle(
                      fontSize: 20,
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
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "الموجه الفني العام لمادة اللغة الفرنسية ",
                        style: TextStyle(
                          fontSize: 20,
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
                      ),
                      Text(
                        "أ/ أنور الكندري ",
                        style: TextStyle(
                          fontSize: 20,
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
                          fontSize: 20,
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
                      ),
                      Text(
                        "( منطقة الأحمدي التعليمية )   ",
                        style: TextStyle(
                          fontSize: 20,
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
                      ),
                      Text(
                        "د/ سعود الشمري ",
                        style: TextStyle(
                          fontSize: 20,
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
                          fontSize: 20,
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
                      ),
                      Text(
                        " ( منطقة الأحمدي التعليمية )",
                        style: TextStyle(
                          fontSize: 20,
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
                      ),
                      Text(
                        "أ/ رفا القناعي ",
                        style: TextStyle(
                          fontSize: 20,
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
                          fontSize: 20,
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
                      ),
                      Text(
                        " ( ثانوية لبنى بنت الحارث  )",
                        style: TextStyle(
                          fontSize: 20,
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
                      ),
                      Text(
                        "أ/روضة حمادي بوجنيح ",
                        style: TextStyle(
                          fontSize: 20,
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
                          fontSize: 20,
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
                      ),
                      Text(
                        "أ/ منيره ابراهيم ابو حمره ",
                        style: TextStyle(
                          fontSize: 20,
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
                      ),
                      Text(
                        "( ثانوية لبنى بنت الحارث  ) ",
                        style: TextStyle(
                          fontSize: 20,
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
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
