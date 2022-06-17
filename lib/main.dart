import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


