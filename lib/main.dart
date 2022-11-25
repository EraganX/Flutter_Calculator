import 'package:calculator/screen/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyCAL());
}

class MyCAL extends StatelessWidget {
  const MyCAL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}
