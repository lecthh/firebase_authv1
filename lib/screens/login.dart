import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authv1/screens/home.dart';
import 'package:firebase_authv1/screens/onboarding.dart';

import '../constants/app_styles.dart';
import '../constants/button.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Padding(
        padding: const EdgeInsets.all(31),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/icons/logo_white.png"),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Spotify",
                style: SenBold.copyWith(fontSize: 19, color: kWhite),
              ),
              const SizedBox(
                height: 21,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: SenMedium.copyWith(fontSize: 16, color: kWhite),
                  ),
                  TextField(
                    controller: _emailController,
                    cursorColor: kDarkGrey,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kGrey,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Password",
                    style: SenMedium.copyWith(fontSize: 16, color: kWhite),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: kDarkGrey,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kGrey,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap:() => _login(context),
                      child: Button(
                          key: const ValueKey("login"),
                          text: "Log in",
                          textStyle:
                              SenBold.copyWith(fontSize: 15, color: kBlack),
                          width: 90,
                          height: 42,
                          color: kGreen),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}