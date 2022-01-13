import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_screen.dart';
import 'constants.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
        future: _init,
        builder: (context,snapShot){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: kSecondColor,
              )
            ),
            title: 'Réservi',
            //home: MainScreen(),
            initialRoute: '/',
            routes: {
              '/' : (context) => SplashScreen(),
              '/SignInWithEmail' : (context) => SignInWithEmail(),
              '/SignUpScreen' : (context) => SignUpScreen(),
              '/MainScreen' : (context) => MainScreen(),
            },
          );
        }
    );
  }
}