import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SignInWithEmail())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background1.png"),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Spacer(),
            /*Image.asset(
              "assets/background1.png",
              height: 300.0,
              width: 300.0,
            ),*/
            Spacer(),
            Text(
              "Réservi",
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
            Spacer(),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
