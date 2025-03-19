import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:git_baru/login_page.dart';
=======
import 'home_page.dart';
>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyLoginPage(),
=======
      title: 'kalkulator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 255, 242)),
      ),
      home: const MyHomePage(title: 'kalkulator suhu'),
>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
    );
  }
}
