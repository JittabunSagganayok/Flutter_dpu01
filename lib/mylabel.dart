import 'package:flutter/material.dart';

class Mylabel extends StatelessWidget {
  //const Mylabel({super.key});

  final double? width;
  final double? height;
  final Color? color;
  final String text;
  final Color? textColor;

  const Mylabel(
      {super.key,
      this.width,
      this.height,
      this.color,
      required this.text,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
