// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:myapp/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
