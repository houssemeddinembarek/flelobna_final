import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/course.dart';
import 'package:flelobna/screens/detail_course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCourses extends StatelessWidget {
  ListCourses({super.key});

  List<Course> courses = [
    Course(
      name: "DELF A2",
      description: "Chahd Athamdan",
      pathPdf: "assets/files/1.pdf",
      couverture: "assets/couverture/1.png",
      size: "527 mo",
    ),
    Course(
      name: "COMPREHENSION ECRITE DELF B1",
      description: "Dalal Alshammari",
      pathPdf: "assets/files/2.pdf",
      couverture: "assets/couverture/2.png",
      size: "527 mo",
    ),
    Course(
      name: "LA PRODUCTION Ecrite DELF B1",
      description: "Rim Alazmi",
      pathPdf: "assets/files/3.pdf",
      couverture: "assets/couverture/3.png",
      size: "527 mo",
    ),
    Course(
      name: "LES VERBES PRONOMINAUX",
      description: "Imane Mohammed Ramzy",
      pathPdf: "assets/files/4.pdf",
      couverture: "assets/couverture/4.png",
      size: "527 mo",
    ),
    Course(
      name: "DES EXPRESSIONS POUR LA COMMUNICATION QUOTIDIENNE",
      description: "Farah Alshammari",
      pathPdf: "assets/files/5.pdf",
      couverture: "assets/couverture/5.png",
      size: "527 mo",
    ),
    Course(
      name: "LES DETERMINANTS",
      description: "Hessah Algahtani",
      pathPdf: "assets/files/6.pdf",
      couverture: "assets/couverture/6.png",
      size: "527 mo",
    ),
    Course(
      name: "LA PHRASE SIMPLE",
      description: "Mariam sabeel",
      pathPdf: "assets/files/7.pdf",
      couverture: "assets/couverture/7.png",
      size: "527 mo",
    ),
    Course(
      name: "LES ADJECTIFS QUALIFICATIFS",
      description: "Rim almutairi",
      pathPdf: "assets/files/8.pdf",
      couverture: "assets/couverture/8.png",
      size: "527 mo",
    ),
    Course(
      name: "LA PHRASE COMPLEXE",
      description: "Sarah Almarri",
      pathPdf: "assets/files/9.pdf",
      couverture: "assets/couverture/9.png",
      size: "527 mo",
    ),
    Course(
      name: "LE PASSE COMPOSE",
      description: "Chahd Alazmi",
      pathPdf: "assets/files/10.pdf",
      couverture: "assets/couverture/10.png",
      size: "527 mo",
    ),
    Course(
      name: "LES EXPRESSIONS IDIOPATHIQUES FACILE EN FRANCAIS",
      description: "Amal Alkhalat",
      pathPdf: "assets/files/11.pdf",
      couverture: "assets/couverture/11.png",
      size: "527 mo",
    ),
    Course(
      name: "LES MERVEILLES DE FRANCE",
      description: "Mouna Almaie",
      pathPdf: "assets/files/12.pdf",
      couverture: "assets/couverture/12.png",
      size: "527 mo",
    ),
    Course(
      name: "LA FICHE PEDAGOGIQUE D'UN COURS DE FLE",
      description: "Raoudha Boujnaieh",
      pathPdf: "assets/files/14.pdf",
      couverture: "assets/couverture/14.png",
      size: "527 mo",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des Revues',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            letterSpacing: size.width * 0.003,
            color: AppColors.blueTextColor,
            // decoration: TextDecoration.underline,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.blueBgTop,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(size.height * 0.02),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [Colors.cyan, Colors.blueGrey],
            colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
          ),
        ),
        child: ListView.separated(
          itemCount: courses.length,
          separatorBuilder: (context, index) {
            // Add space between items using a SizedBox
            return SizedBox(height: size.height * 0.01);
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('Tapped on ${courses[index].toJson()}');
                Get.to(DetailCourse(course: courses[index]));
              },
              child: Container(
                  width: size.width * 0.6,
                  height: size.height * 0.15,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width * 0.2,
                          height: size.height * 0.15,
                          child: Image.asset(courses[index].couverture)),
                      Container(
                        width: size.width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courses[index].name,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Produit par : ${courses[index].description}",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              width: size.width * 0.55,
                              alignment: Alignment.topRight,
                              child: Text(
                                courses[index].size,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  // ListTile(
                  //   leading: SizedBox(
                  //       width: size.width * 0.2,
                  //       height: size.height * 0.15,
                  //       child: Image.asset('assets/images/logos.jpeg')),
                  //   title: Text(courses[index].name),
                  //   subtitle: Text(courses[index].description),
                  // ),
                  ),
            );
          },
        ),
      ),
    );
  }
}
