import 'package:flutter/material.dart';
import 'package:my_profile01/mystar.dart';

class MyStarRating extends StatelessWidget {
  //const MyStarRating({super.key});

  final Color color;
  final int value;
  final double starSize;

  const MyStarRating(
      {super.key,
      this.color = Colors.orange,
      required this.value,
      this.starSize = 25});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        value,
        (index) => Padding(
          padding: EdgeInsets.all(2),
          child: MyStar(
            color: color,
            size: starSize,
          ),
        ),
      ),
    );
  }
}
