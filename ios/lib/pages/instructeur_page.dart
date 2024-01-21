import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testsdk/pages/navigation_page.dart';
import 'package:testsdk/pages/video_screen.dart';

class InstructeurPage extends StatelessWidget {
  InstructeurPage({
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
                      width: size.width * 0.42,
                      child: Text(
                        " L'équipe de travail ",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          letterSpacing: size.width * 0.003,
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
                    // Container(
                    //   width: size.width * 0.42,
                    //   height: size.height * 0.003,
                    //   decoration: BoxDecoration(color: Colors.white),
                    // ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Noura Al ajmi ",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Le document audiovisuel de la 12ème année est réalisé par les enseignantes : ",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "chahd Alhamdan",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Dalal Al Shummeri",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Iman Ramzi",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Les revues sont réalisées par les enseignantes:",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Raoudha Boujnaieh ",
                        style: TextStyle(
                          fontSize: size.width * 0.03,

                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Iman Ramzi",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Dalal Al Shummeri",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Amal Al khalaf",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Rim Almutiri",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "farah Al Shummeri",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Hessa Al Gahtani",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Mouna Almaii",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Mariam Sabil",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        " Sara Al Meri",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Rim Al Azmi ",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Chahd Alazmi",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sous la direction de:  ",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        " Mme. Raoudha Boujnaieh : chef de département",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Mme. Rafa Alguenai : Inspectrice technique ",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Mme. Munira Abuhamra",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.85,
                      alignment: Alignment.center,
                      child: Text(
                        "Directrice du lycée",
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          letterSpacing: size.width * 0.003,
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
                    ),
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
