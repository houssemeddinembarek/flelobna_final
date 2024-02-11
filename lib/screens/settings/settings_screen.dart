import 'package:firebase_auth/firebase_auth.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/auth/login_screen.dart';
import 'package:flelobna/screens/home-screen.dart';
import 'package:flelobna/screens/instructeur_page.dart';
import 'package:flelobna/screens/introduction-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void deleteEmail() {
    final storage = GetStorage();
    storage.remove('email');
  }

  Future<void> signOut() async {
    final storage = GetStorage();

    // Remove user data from GetStorage
    storage.remove('email');
    storage.remove('familyName');
    storage.remove('givenName');

    // Navigate back to the login screen or another appropriate screen
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
        title: Text(
          'Parametre',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            letterSpacing: size.width * 0.003,
            color: AppColors.blueTextColor,
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.width * 0.15,
            horizontal: size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  onPressed: () async {
                    if (GetStorage().read('familyName') != null &&
                        GetStorage().read('givenName') != null) {
                      signOut();
                    } else {
                      await FirebaseAuth.instance.signOut();
                      deleteEmail();
                      Get.offAll(LoginPage(),
                          transition: Transition.rightToLeft);
                    }
                  },
                  child: Text('Se Deconnecter'),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => IntroductionScreen(),
                        transition: Transition.rightToLeft);
                  },
                  child: Text('Objectif'),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => HomeScreen(),
                        transition: Transition.rightToLeft);
                  },
                  child: Text('Equipe Administrative'),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => InstructeurPage(),
                        transition: Transition.rightToLeft);
                  },
                  child: Text('Equipe de travail'),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  onPressed: () {
                    if (GetStorage().read('familyName') != null &&
                        GetStorage().read('givenName') != null) {
                      signOut();
                    } else {
                      deleteUserAccount(context);
                      Get.offAll(LoginPage(),
                          transition: Transition.rightToLeft);
                    }
                  },
                  child: Text(
                    'Supprimer votre compte',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
