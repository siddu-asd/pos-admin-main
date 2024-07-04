import 'package:admin_possupermarket/login.dart';
import 'package:admin_possupermarket/navbar.dart';
import 'package:admin_possupermarket/totalproducats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter New',
      theme: ThemeData(
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TotalProducts(),
    );
  }
}
