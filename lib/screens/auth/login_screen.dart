import 'package:flelobna/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flelobna/screens/auth/signup_screen.dart';
import 'package:flelobna/screens/navigation_screen.dart';
import 'package:flelobna/widgets/line_bar.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  bool _isObscured = true;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      try {
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        Get.offAll(NavigationScreen());
        final getStorage = GetStorage();
        getStorage.write("email", _email);
      } catch (e) {
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text("Login failed. Please check your email and password."),
          ),
        );
      }
    }
  }

  Future<void> _signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      GetStorage().write('email', credential.email);
      GetStorage().write('familyName', credential.familyName);
      GetStorage().write('givenName', credential.givenName);

      Get.offAll(NavigationScreen());
    } catch (error) {
      print("Error signing in with Apple: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sign-In with Apple ID failed. Please try again."),
        ),
      );
    }
  }

  bool isIOS() {
    return Theme.of(context).platform == TargetPlatform.iOS;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              vertical: size.width * 0.1,
              horizontal: size.width * 0.05,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.symmetric(
                vertical: size.width * 0.08,
                horizontal: size.width * 0.05,
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.23,
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
                      SizedBox(height: size.height * 0.06),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bienvenue sur notre application',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: size.width * 0.07,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(
                                    2.0, 2.0), // Define the shadow offset
                                blurRadius: 3.0, // Define the blur radius
                                color: AppColors.blue.withOpacity(
                                    0.5), // Define the shadow color
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.06),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (input) => _email = input!,
                      ),
                      TextFormField(
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                        ),
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (input) => _password = input!,
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                        width: size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: _login,
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppColors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Container(
                          width: size.width * 0.8,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Vous n\'avez pas de compte ?',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: size.width * 0.03)),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => SignUpScreen(),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Text(' Inscrivez-vous.',
                                      style: TextStyle(
                                          color: AppColors.blue,
                                          fontSize: size.width * 0.03))),
                            ],
                          )),
                      SizedBox(height: size.height * 0.01),
                      isIOS()
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LineBar(
                                      width: size.width * 0.3,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Georgia',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    LineBar(
                                      width: size.width * 0.3,
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.01),
                                // Add the "Sign In with Apple ID" button here:
                                SignInWithAppleButton(
                                  onPressed: _signInWithApple,
                                )
                              ],
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
