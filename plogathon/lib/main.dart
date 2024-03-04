import 'package:flutter/material.dart';
import 'package:plogathon/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(),
    );
  }
}

class Environment {
  static const MAPS_API_KEY = String.fromEnvironment('MAPS_API_KEY');
}
