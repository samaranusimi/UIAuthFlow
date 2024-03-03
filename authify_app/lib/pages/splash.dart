import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:authify_app/pages/login_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.greenAccent,
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Authify",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.amber,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
      ),
      duration: 2000,
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
