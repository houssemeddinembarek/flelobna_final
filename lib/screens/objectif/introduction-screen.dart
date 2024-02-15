import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blueBgTop,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(
          // top: size.height * 0.08,
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
        child: Stack(
          children: [
            Positioned(
              left: size.width * 0.02,
              right: size.width * 0.02,
              bottom: size.height * 0.08,
              top: size.height * 0.3,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.GreeFonce, AppColors.GreeMedium],
                  ),
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.07,
              right: size.width * 0.07,
              bottom: size.height * 0.13,
              top: size.height * 0.1,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.5,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: AppColors.whiteFlue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text(
                      "L'objectif de notre projet :",
                      style: TextStyle(
                          color: AppColors.blueTextColor,
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Que vous soyez un passionné de linguistique, un étudiant curieux, un enseignant à la recherche de ressources pédagogiques ou simplement un amoureux de la langue française , cette application saura éveiller votre curiosité et approfondir vos connaissances linguistiques et culturelles.",
                      style: TextStyle(
                          color: AppColors.blueTextColor,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // Container(
                    //   width: size.width * 0.7,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       GestureDetector(
                    //           onTap: () {
                    //             // Get.to(() => VideoScreen(
                    //             //   videoAssets: [
                    //             //     'assets/video/video11.mp4',
                    //             //   ],
                    //             // ));
                    //           },
                    //           child: SizedBox(
                    //             width: size.width * 0.3,
                    //             child: ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                 primary: Colors.cyan.withOpacity(0.4),
                    //                 shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                 ),
                    //               ),
                    //               onPressed: () {
                    //                 Get.to(()=>NavigationScreen());
                    //               },
                    //               child: Row(
                    //                 children: [
                    //                   Text(
                    //                     'Suivant',
                    //                     style: TextStyle(color: Colors.white),
                    //                   ),
                    //                   SizedBox(width: size.width * 0.01),
                    //                   Icon(Icons.arrow_forward,
                    //                       size: 15, color: Colors.white),
                    //                 ],
                    //               ),
                    //             ),
                    //           )),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.25,
              right: size.width * 0.25,
              bottom: size.height * 0.7,
              top: size.height * 0.02,
              child: Container(
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.GreeFonce, AppColors.GreeMedium],
                  ),
                ),
                child: Image.asset('assets/images/logosbg.png'),
              ),
            ),
          ],
        ),
        // child: ,
      ),
    );
  }
}
