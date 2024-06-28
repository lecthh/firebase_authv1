import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authv1/screens/onboarding.dart';

import '../constants/app_styles.dart';
import '../constants/button.dart';
import 'home.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      // Handle sign-up error
      print('Sign-up failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        title: Text(
          "Create account",
          style: SenBold.copyWith(fontSize: 16, color: kWhite),
        ),
        centerTitle: true,
        backgroundColor: kBlack,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => Onboarding())));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xff030303),
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.chevron_left,
              color: kWhite,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 31, right: 31),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What's your email?",
                  style: SenBold.copyWith(fontSize: 20, color: kWhite),
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
                  "You'll need to confirm this email later.",
                  style: SenBold.copyWith(fontSize: 8, color: kWhite),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a Password",
                  style: SenBold.copyWith(fontSize: 20, color: kWhite),
                ),
                TextField(
                  controller: _passwordController,
                  cursorColor: kDarkGrey,
                  obscureText: true,
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
                  height: 43,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => _signUp(context),
                    child: Button(
                      key: const ValueKey("done"),
                      text: "Sign up",
                      textStyle: SenSemiBold.copyWith(fontSize: 15, color: kBlack),
                      width: 82,
                      height: 42,
                      color: const Color(0xff535353),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}