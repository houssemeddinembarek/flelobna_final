import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _repeatPassword = "";
  bool _isObscured = true;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      print(_email);
      print(_password);

      try {
        await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        FirebaseFirestore.instance.collection('users').add({
          'firstName': _firstName,
          'lastName': _lastName,
          'email': _email,
        });
        Get.to(() => LoginPage());
      } catch (e) {
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration failed. Please try again."),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(
        top: 32,
        bottom: 8,
        left: 8,
        right: 8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
        ),
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
                  width: size.width * 0.3,
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
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Flelobna',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: size.width * 0.05,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Bienvenue',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: size.width * 0.06,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      // shadows: <Shadow>[
                      //   Shadow(
                      //     offset: Offset(2.0, 2.0),
                      //     // Define the shadow offset
                      //     blurRadius: 3.0,
                      //     // Define the blur radius
                      //     color: AppColors.blue
                      //         .withOpacity(0.5), // Define the shadow color
                      //   ),
                      // ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Veillez entrer votre Prénom';
                    }
                    return null;
                  },
                  onSaved: (input) => _firstName = input!,
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Veillez entrer votre Nom';
                    }
                    return null;
                  },
                  onSaved: (input) => _lastName = input!,
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (input) => _email = input!,
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
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
                SizedBox(height: size.height * 0.06),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(
                      'Inscription',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: size.width*0.05,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
                    width: size.width * 0.9,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Vous avez déja un compte ?',
                            style: TextStyle(
                                color: AppColors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => LoginPage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text(' Se connecter.',
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
