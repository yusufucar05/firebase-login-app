// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:flutter/material.dart';
//import 'package:loginappfire/screens/signup_screen.dart';

Image LogoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 400,
    height: 400,
    color: Colors.white,
    colorBlendMode: BlendMode.modulate,
  );
}

Image ContentImageWidget(String imageName) {
  return Image.asset(imageName, fit: BoxFit.fitWidth, width: 400, height: 400);
}

Container ContentWidget(String contentText, imageName) {
  return Container(
    width: 200,
    height: 440,
    color: Colors.amberAccent,
    child: SafeArea(
      child: Column(
        children: [ContentImageWidget(imageName), Text(contentText)],
      ),
    ),
  );
}

TextField reusTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white70),
      hintText: text,
      hintStyle: TextStyle(color: Colors.white54),
      labelStyle: TextStyle(color: Colors.white70),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    onTap: () {},
  );
}

Container SignInSignUpButton(
  BuildContext context,
  bool isLogin,
  Function onTop,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTop();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((States) {
          if (States.contains(WidgetState.pressed)) {
            return Colors.black12;
          }
          return Colors.white;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      child: Text(
        isLogin ? "log in" : "Sign Up",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

BoxDecoration CostomBoxDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple, Colors.amberAccent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
