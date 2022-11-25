import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final textColor;
  final color;
  final String value;

  Buttons({
    this.textColor,
    required this.value,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
          child: Center(
            child: Text(value, style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
