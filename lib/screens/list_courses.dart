import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/course.dart';
import 'package:flelobna/screens/detail_course.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class ListCourses extends StatefulWidget {
  ListCourses({super.key});

  @override
  State<ListCourses> createState() => _ListCoursesState();
}

class _ListCoursesState extends State<ListCourses> {
  List<Course> courses = [
    Course(
      name: "DELF A2",
      description: "Chahd Athamdan",
      pathPdf: "assets/files/1.pdf",
      couverture: "assets/couverture/1.png",
      size: "2 mo",
    ),
    Course(
      name: "COMPREHENSION ECRITE DELF B1",
      description: "Dalal Alshammari",
      pathPdf: "assets/files/2.pdf",
      couverture: "assets/couverture/2.png",
      size: "2 mo",
    ),
    Course(
      name: "LA PRODUCTION Ecrite DELF B1",
      description: "Rim Alazmi",
      pathPdf: "assets/files/3.pdf",
      couverture: "assets/couverture/3.png",
      size: "2 mo",
    ),
    Course(
      name: "LES VERBES PRONOMINAUX",
      description: "Imane Mohammed Ramzy",
      pathPdf: "assets/files/4.pdf",
      couverture: "assets/couverture/4.png",
      size: "2 mo",
    ),
    Course(
      name: "DES EXPRESSIONS POUR LA COMMUNICATION QUOTIDIENNE",
      description: "Farah Alshammari",
      pathPdf: "assets/files/5.pdf",
      couverture: "assets/couverture/5.png",
      size: "2 mo",
    ),
    Course(
      name: "LES DETERMINANTS",
      description: "Hessah Algahtani",
      pathPdf: "assets/files/6.pdf",
      couverture: "assets/couverture/6.png",
      size: "2 mo",
    ),
    Course(
      name: "LA PHRASE SIMPLE",
      description: "Mariam sabeel",
      pathPdf: "assets/files/7.pdf",
      couverture: "assets/couverture/7.png",
      size: "2 mo",
    ),
    Course(
      name: "LES ADJECTIFS QUALIFICATIFS",
      description: "Rim almutairi",
      pathPdf: "assets/files/8.pdf",
      couverture: "assets/couverture/8.png",
      size: "2 mo",
    ),
    Course(
      name: "LA PHRASE COMPLEXE",
      description: "Sarah Almarri",
      pathPdf: "assets/files/9.pdf",
      couverture: "assets/couverture/9.png",
      size: "2 mo",
    ),
    Course(
      name: "LE PASSE COMPOSE",
      description: "Chahd Alazmi",
      pathPdf: "assets/files/10.pdf",
      couverture: "assets/couverture/10.png",
      size: "2 mo",
    ),
    Course(
      name: "LES EXPRESSIONS IDIOPATHIQUES FACILE EN FRANCAIS",
      description: "Amal Alkhalat",
      pathPdf: "assets/files/11.pdf",
      couverture: "assets/couverture/11.png",
      size: "2 mo",
    ),
    Course(
      name: "LES MERVEILLES DE FRANCE",
      description: "Mouna Almaie",
      pathPdf: "assets/files/12.pdf",
      couverture: "assets/couverture/12.png",
      size: "2 mo",
    ),
    Course(
      name: "LA FICHE PEDAGOGIQUE D'UN COURS DE FLE",
      description: "Raoudha Boujnaieh",
      pathPdf: "assets/files/14.pdf",
      couverture: "assets/couverture/14.png",
      size: "2 mo",
    ),
  ];
  List<Course> filteredList = [];

  @override
  void initState() {
    filteredList.addAll(courses);
    super.initState();
  }

  void filterList(String query) {
    setState(() {
      filteredList.clear();
      filteredList.addAll(courses.where(
          (item) => item.name.toLowerCase().contains(query.toLowerCase())));
    });
  }

  bool isIOS() {
    return Theme.of(context).platform == TargetPlatform.iOS;
  }

  Future<void> signOutFromApple() async {
    await GetStorage().remove('email');
    await GetStorage().remove('familyName');
    await GetStorage().remove('givenName');
  }

  void showConnectWithAppleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetStorage().read('familyName') != null ?
              ElevatedButton(
                onPressed: () async {
                  await signOutFromApple();
                  Navigator.of(context).pop();
                },
                child: Text('Sign Out'),
              ): Container(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  ))
            ],
          ),
          content: Text(
              'Souhaitez-vous vous connecter avec votre identifiant Apple?'),
          actions: <Widget>[
            SignInWithAppleButton(
              onPressed: () async {
                final credential = await SignInWithApple.getAppleIDCredential(
                  scopes: [
                    AppleIDAuthorizationScopes.email,
                    AppleIDAuthorizationScopes.fullName,
                  ],
                );
                GetStorage().write('email', credential.email);
                GetStorage().write('familyName', credential.familyName);
                GetStorage().write('givenName', credential.givenName);
                Navigator.of(context).pop();

                print(credential);
              },
            ),

          ],
        );
      },
    );
  }

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Liste des Revues',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                letterSpacing: size.width * 0.003,
                color: AppColors.blueTextColor,
              ),
            ),
            isIOS()
                ? GestureDetector(
                    onTap: () {
                      showConnectWithAppleDialog();
                      print(GetStorage().read('email'));
                    },
                    child: Icon(
                      Icons.person,
                      color: AppColors.blueTextColor,
                    ),
                  )
                : Container()
          ],
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
            colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
          ),
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (query) {
                _debouncer.run(() {
                  filterList(query);
                });
              },
              decoration: InputDecoration(
                labelText: 'Rechercher',
                hintText: 'Veuilez saisir le nom d\' un revue',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: filteredList.length,
                padding: EdgeInsets.only(top: size.height * 0.01),
                separatorBuilder: (context, index) {
                  return SizedBox(height: size.height * 0.01);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailCourse(course: filteredList[index]));
                    },
                    child: Container(
                      width: size.width * 0.6,
                      height: size.height * 0.15,
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
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
                            child: Image.asset(filteredList[index].couverture),
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredList[index].name,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Produit par : ${filteredList[index].description}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                  width: size.width * 0.55,
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    filteredList[index].size,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Debouncer class to delay search
class Debouncer {
  final int milliseconds;
  VoidCallback action = () {};

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (this.action != null) {
      this.action();
    }
    this.action = () {
      Future.delayed(Duration(milliseconds: milliseconds), () {
        action();
      });
    };
  }
}
