import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:git_baru/login_page.dart';
import 'package:git_baru/temperature_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TemperatureProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyLoginPage(),
    );
  }
}
