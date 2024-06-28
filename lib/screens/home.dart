import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authv1/screens/onboarding.dart';

import '../constants/app_styles.dart';
import '../constants/button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Onboarding()));
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String userEmail = user?.email ?? '';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello $userEmail!",
                    style: SenMedium.copyWith(fontSize: 16, color: kWhite),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => _logout(context),
                    child: Button(
                        key: const ValueKey("logout"),
                        text: "Log out",
                        textStyle:
                            SenBold.copyWith(fontSize: 15, color: kBlack),
                        width: 90,
                        height: 42,
                        color: kGreen),
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