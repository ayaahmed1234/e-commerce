import 'package:ecommerce/features/auth/signup/signup_screen.dart';
import 'package:ecommerce/features/home/home_screen.dart';
import 'package:ecommerce/features/home/nav_bar.dart';
import 'package:flutter/material.dart';

import 'features/splash/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-shirt App',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}

