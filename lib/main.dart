import 'package:flutter/material.dart';
import 'package:myshopsilvia/listalluser.dart';
import 'package:myshopsilvia/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 253, 205, 133)),
        useMaterial3: true,
      ),   
      home: SplashScreen(),
    );
  }
}
