// ignore_for_file: override_on_non_overriding_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginappfire/reusable_widgets/resuble_widgets.dart';
import 'package:loginappfire/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            child: Center(
              child: Column(
                children: [
                  reusTextField(
                    "user Name",
                    Icons.person,
                    false,
                    userNameController,
                  ),
                  SizedBox(height: 20),
                  reusTextField('Email', Icons.email, false, emailController),
                  SizedBox(height: 20),
                  reusTextField(
                    "Enter Password",
                    Icons.password,
                    true,
                    passwordController,
                  ),
                  SizedBox(height: 20),
                  SignInSignUpButton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then((value) {
                          print("Created New Account");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          ).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        });
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
