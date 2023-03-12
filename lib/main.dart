// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:primeiro_app/screens/form_screen.dart';
import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meu Primeiro App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FormScreen(),
    );
  }
}



