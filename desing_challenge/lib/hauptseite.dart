import 'package:flutter/material.dart';
import 'package:desing_challenge/screen1.dart';

class Hauptseite extends StatelessWidget {
  const Hauptseite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_mainscreen.png', // <-- tu fondo
              fit: BoxFit.cover, // que cubra todo
            ),
          )
        ],
      ),
    );
  }
}
