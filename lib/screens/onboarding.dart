import '../constants/app_styles.dart';
import '../constants/button.dart';
import 'login.dart';
import 'signup.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset("assets/images/bgs/start_bg.png"),
            Image.asset("assets/images/icons/logo_white.png"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Millions of Songs.\nFree on Spotify.",
              style: SenBold,
            ),
            const SizedBox(
              height: 22,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SignUp())
                      )
                    );
                  },
                  child: Button(
                    key: const ValueKey("start_signup"),
                    text: "Sign up free",
                    textStyle: SenBold.copyWith(color: kBlack, fontSize: 16),
                    width: 337,
                    height: 49,
                    color: kGreen,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Login())
                      )
                    );
                  },
                  child: Button(
                    key: const ValueKey("start_login"),
                    text: "Log in",
                    textStyle: SenBold.copyWith(color: kWhite, fontSize: 16),
                    width: 337,
                    height: 49,
                    color: kBlack,
                  ),
                ),
                const SizedBox(
                  height: 54,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}