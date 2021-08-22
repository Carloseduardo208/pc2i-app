import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/splash.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
      initialRoute: '/splash',
      routes: {
        '/login': (context) => LoginScreen(),
        '/splash': (context) => SplashScreen(),
      },
    ),
  );
}
