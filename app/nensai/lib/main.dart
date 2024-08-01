import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/home.dart';


void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(
      duration: 4,
      nextPage: const Home(),
    ),
    );
  }
}