import 'package:flutter/material.dart';

class Container1 extends StatelessWidget {
  final double laenge;
  final String text;
  final Color? color1;
  final Color color2;

  const Container1(
      {super.key,
      required this.laenge,
      required this.text,
      this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: laenge),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: color2, fontSize: 16),
      ),
    );
  }
}
