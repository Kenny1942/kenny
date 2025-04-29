import 'package:flutter/material.dart';

class Container1 extends StatelessWidget {
  final double laenge;
  final String text;

  const Container1({super.key, required this.laenge, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: laenge),
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(235, 170, 120, 170),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
