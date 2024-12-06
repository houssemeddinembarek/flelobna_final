import 'package:firebase_auth/firebase_auth.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/controller/auth_controller.dart';
import 'package:flelobna/screens/auth/login_screen.dart';
import 'package:flelobna/screens/navigation_screen.dart';
import 'package:flelobna/screens/objectif/introduction_arabe_screen.dart';
import 'package:flelobna/screens/settings/home-screen.dart';
import 'package:flelobna/screens/instructeur_page.dart';
import 'package:flelobna/screens/objectif/introduction-screen.dart';
import 'package:flelobna/screens/settings/settings_button.dart';
import 'package:flelobna/widgets/edit_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AuthController authController = Get.put(AuthController());
  GetStorage box = GetStorage();

  @override
  void initState() {
    if (box.read("email") != null && box.read("email") != "")
      authController.getUserByEmail(box.read('email'));
    // print(box.read('email'));
    super.initState();
  }

  void deleteEmail() {
    box.remove('email');
  }

  Future<void> signOut() async {
    // Remove user data from GetStorage
    box.remove('email');
    box.remove('familyName');
    box.remove('givenName');

    Get.offAll(LoginPage());
  }

  Future<void> deleteUserAccount(BuildContext context) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Assuming you use the user's UID as the document ID in Firestore
        String userUid = user.uid;

        // Delete the user's document from Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userUid)
            .delete();

        // Then delete the user's account from Firebase Authentication
        await user.delete();
        deleteEmail();
        // Show a success message (optional)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User account deleted successfully')),
        );

        // Navigate the user away from the current page or perform other clean up operations
        // For example, navigate to the login page
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      // If any error occurs, show an error message
      print(
          e); // Consider using a logging tool or service for better error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user account')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Paramètre',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  letterSpacing: size.width * 0.003,
                  color: AppColors.blueTextColor,
                ),
              ),
              if (box.read("email") != null && box.read("email") != "")
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    child: Container(
                      width: size.width * 0.07,
                      height: size.width * 0.07,
                      color: AppColors.blueTextColor,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditNameDialog(
                                  initialFirstName:
                                      authController.userDetail.value.firstName,
                                  initialLastName:
                                      authController.userDetail.value.lastName,
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.edit,
                            color: AppColors.whiteFlue,
                            size: size.width * 0.05,
                          )),
                    )),
            ],
          ),
        ),
        backgroundColor: AppColors.blueBgTop,
        elevation: 0,
      ),
      body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
            ),
          ),
          child: Obx(
            () => authController.loadinSettingsScreen.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.width * 0.05,
                      horizontal: size.width * 0.05,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          (box.read("email") != null && box.read("email") != "")
                              ? Container(
                                  width: size.width * 0.9,
                                  height: size.height * 0.22,
                                  decoration: BoxDecoration(
                                    color: Colors.white54.withOpacity(0.3),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      (box.read("email") != null &&
                                              box.read("email") != "")
                                          ? Container(
                                              width: size.width * 0.7,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text('Email: ',
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.GreeFonce,
                                                      )),
                                                  Text(
                                                      authController.userDetail
                                                          .value.email
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.GreeFonce,
                                                      )),
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                      (box.read("email") != null &&
                                              box.read("email") != "")
                                          ? Container(
                                              width: size.width * 0.7,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text('Prenom: ',
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.GreeFonce,
                                                      )),
                                                  Text(
                                                      authController.userDetail
                                                          .value.firstName
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.GreeFonce,
                                                      )),
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                      Container(
                                        width: size.width * 0.7,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Nom: ',
                                                style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.GreeFonce,
                                                )),
                                            Text(
                                                authController
                                                    .userDetail.value.lastName
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.GreeFonce,
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          (box.read("email") != null && box.read("email") != "")
                              ? SettingsButton(
                                  text: 'Se Deconnecter',
                                  textColor: AppColors.blueTextColor,
                                  icon: Icons.logout,
                                  iconColor: AppColors.blueTextColor,
                                  onTap: () async {
                                    if (box.read('familyName') != null &&
                                        box.read('givenName') != null) {
                                      signOut();
                                    } else {
                                      await FirebaseAuth.instance.signOut();
                                      deleteEmail();
                                      Get.offAll(LoginPage(),
                                          transition: Transition.rightToLeft);
                                    }
                                  },
                                )
                              : SettingsButton(
                                  text: 'Se Connecter',
                                  textColor: AppColors.blueTextColor,
                                  icon: Icons.login,
                                  iconColor: AppColors.blueTextColor,
                                  onTap: () async {
                                    if (box.read('familyName') != null &&
                                        box.read('givenName') != null) {
                                      Get.to(()=>NavigationScreen());
                                    } else {
                                      Get.to(()=>LoginPage());
                                    }
                                  },
                                ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SettingsButton(
                            text: 'Objectif',
                            textColor: AppColors.blueTextColor,
                            icon: Icons.book,
                            iconColor: AppColors.blueTextColor,
                            onTap: () {
                              Get.to(() => IntroductionScreen(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SettingsButton(
                            text: 'الهدف من هذه التطبيقة',
                            textColor: AppColors.blueTextColor,
                            icon: Icons.star,
                            iconColor: AppColors.blueTextColor,
                            onTap: () {
                              Get.to(() => IntroductionArabeScreen(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SettingsButton(
                            text: 'Equipe Administrative',
                            textColor: AppColors.blueTextColor,
                            icon: Icons.group,
                            iconColor: AppColors.blueTextColor,
                            onTap: () {
                              Get.to(() => HomeScreen(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SettingsButton(
                            text: 'Equipe de travail',
                            textColor: AppColors.blueTextColor,
                            icon: Icons.group,
                            iconColor: AppColors.blueTextColor,
                            onTap: () {
                              Get.to(() => InstructeurPage(),
                                  transition: Transition.rightToLeft);
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          (box.read("email") != null && box.read("email") != "")
                              ? SettingsButton(
                                  text: 'Supprimer votre compte',
                                  textColor: Colors.red,
                                  icon: Icons.delete_forever,
                                  iconColor: Colors.red,
                                  onTap: () {
                                    if (box.read('familyName') != null &&
                                        box.read('givenName') != null) {
                                      signOut();
                                    } else {
                                      deleteUserAccount(context);
                                      Get.offAll(LoginPage(),
                                          transition: Transition.rightToLeft);
                                    }
                                  },
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
          )),
    );
  }
}
