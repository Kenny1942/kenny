import 'package:desing_challenge/my_card1.dart';
import 'package:flutter/material.dart';

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
              fontSize: 97,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3 // Grosor del borde
                ..color = Color.fromARGB(100, 255, 255, 255), // Color del borde
            ),
          ),
        ),
        Positioned(
          bottom: 140,
          left: 16,
          right: 16,
          child: MyCard1(),
        ),
      ]),
    );
  }
}
