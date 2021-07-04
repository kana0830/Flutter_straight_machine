import 'package:flutter/material.dart';
import 'package:straight_machine/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "つっこみマシーン",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
