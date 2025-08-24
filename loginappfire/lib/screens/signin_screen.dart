// ignore_for_file: override_on_non_overriding_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:loginappfire/reusable_widgets/resuble_widgets.dart';
import 'package:loginappfire/screens/home_screen.dart';
import 'package:loginappfire/screens/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple, Colors.amberAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: [
                LogoWidget('assets/images/logo.png'),
                //SizedBox(height: 30),
                //aslında boşluk daha yiydi ama logo ile birleşik daha hoş durdu.
                reusTextField('Email', Icons.email, false, t1),
                SizedBox(height: 20),
                reusTextField("Enter Password", Icons.password, true, t2),
                SizedBox(height: 20),
                SignInSignUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: t1.text,
                        password: t2.text,
                      )
                      .then((value) {
                        print("log in succesfull");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      })
                      .onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                }),
                SizedBox(height: 20),
                SingUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row SingUpOption() {
    return Row(
      children: [
        const Text(
          " New Accont is click... ",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
