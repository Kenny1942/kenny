import 'package:flutter/material.dart';

class Hauptseite extends StatelessWidget {
  const Hauptseite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 83,
            left: 9,
            child: Text(
              'Choose Your Favorite\nSnack',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 9,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 140, 217),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'B 1',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 140, 217),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'B 2',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 219, 140, 217),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'B 3',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 55,
            right: -100,
            child: Image.asset(
              'assets/images/cut_card.png',
              width: 600,
              height: 600,
            ),
          ),
          Positioned(
            top: 290,
            right: -10,
            child: Image.asset(
              'assets/images/burger.png',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
