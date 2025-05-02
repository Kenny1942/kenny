import 'package:desing_challenge/my_card1.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg_startscreen.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 55,
          left: -40,
          child: Image.asset(
            'assets/images/cupcake_chick.png',
            width: 600,
            height: 600,
          ),
        ),
        Positioned(
          bottom: 300,
          left: -19,
          child: Text(
            'CK SNACK',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 97,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = Color.fromARGB(99, 240, 229, 229),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 16,
          right: 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: MyCard1()),
          ),
        ),
      ]),
    );
  }
}
