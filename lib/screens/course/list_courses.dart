import 'package:flelobna/controller/course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/course.dart';
import 'package:flelobna/screens/course/detail_course.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class ListCourses extends StatefulWidget {
  ListCourses({Key? key});

  @override
  State<ListCourses> createState() => _ListCoursesState();
}

class _ListCoursesState extends State<ListCourses> {
  CourseController courseController = Get.put(CourseController());

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
              GetStorage().read('familyName') != null
                  ? ElevatedButton(
                      onPressed: () async {
                        await signOutFromApple();
                        Navigator.of(context).pop();
                      },
                      child: Text('Sign Out'),
                    )
                  : Container(),
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

  Future<void> _onRefresh() async {
    await courseController.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            // isIOS()
            //     ? GestureDetector(
            //         onTap: () {
            //           showConnectWithAppleDialog();
            //           print(GetStorage().read('email'));
            //         },
            //         child: Icon(
            //           Icons.person,
            //           color: AppColors.blueTextColor,
            //         ),
            //       )
            //     : Container()
          ],
        ),
        elevation: 0,
        backgroundColor: AppColors.blueBgTop,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Container(
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
              SizedBox(
                height: size.height * 0.08,
                child: TextField(
                  onChanged: (query) {
                    courseController.filterList(query);
                  },
                  decoration: InputDecoration(
                    labelText: 'Rechercher',
                    hintText: 'Veuillez saisir le nom d\'un revue',
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                  child: Obx(() => ListView.separated(
                        itemCount: courseController.filteredList.value.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: size.height * 0.01);
                        },
                        itemBuilder: (context, index) {
                          final course =
                              courseController.filteredList.value[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to detail course screen here
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DetailCourse(course: course)));
                            },
                            child: Container(
                              width: size.width * 0.9,
                              height: size.height * 0.17,
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.01,
                                  horizontal: size.height * 0.01),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.2,
                                    height: size.height * 0.15,
                                    child: Image.network(course.couverture!),
                                  ),
                                  Container(
                                    width: size.width * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          course.name!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Produit par : ${course.description}",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // GestureDetector(
                                        //   onTap: () {
                                        //     courseController
                                        //         // .downloadFirebasePDF(
                                        //         //     course.pathPdf)
                                        //     // .downloadFile('document.pdf', course.pathPdf)
                                        //     // .savePdfToDevice('assets/files/1.pdf', 'document.pdf')
                                        //     .downloadAndSaveFile(course.pathPdf, 'document.pdf')
                                        //         .then((_) {
                                        //       print('success');
                                        //       // File has been downloaded successfully
                                        //     }).catchError((error) {
                                        //       // Handle any errors that occurred during the download process
                                        //       print('Error: $error');
                                        //     });
                                        //   },
                                        //   child: Container(
                                        //       width: size.width * 0.1,
                                        //       alignment: Alignment.topRight,
                                        //       child: Icon(Icons.download)),
                                        // ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailCourse(
                                                            course: course)));
                                          },
                                          child: Container(
                                              width: size.width * 0.1,
                                              alignment: Alignment.topRight,
                                              child: Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 18,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
