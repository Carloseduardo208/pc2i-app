import 'package:flutter/material.dart';
import 'package:pc2i_app/screens/login.dart';
import 'package:pc2i_app/screens/signup.dart';
import 'package:pc2i_app/screens/splash.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    ),
  );
}
