import 'package:desing_challenge/my_card2.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

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
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 170, 120, 170),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white, // Color del borde
                        width: 1, // Grosor del borde
                      ),
                    ),
                    child: Text(
                      'All categories',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 170, 120, 170),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white, // Color del borde
                        width: 1, // Grosor del borde
                      ),
                    ),
                    child: Text(
                      'Salty',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 170, 120, 170),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white, // Color del borde
                        width: 1, // Grosor del borde
                      ),
                    ),
                    child: Text(
                      'Sweet',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 170, 120, 170),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white, // Color del borde
                        width: 1, // Grosor del borde
                      ),
                    ),
                    child: Text(
                      'Picant',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            right: 15,
            child: Image.asset(
              'assets/images/cut_card.png',
              width: 350,
              height: 350,
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
          Positioned(
            top: 523,
            left: 9,
            child: Text(
              'We Recommend',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 15,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                MyCard2(
                    imagePath: 'assets/images/cupkake_cat.png',
                    title: 'Moglis Cup',
                    description: 'Strawberry ice cream',
                    price: '8,99',
                    likes: '120',
                    icon: Icons.favorite),
                SizedBox(width: 10),
                MyCard2(
                    imagePath: 'assets/images/icecream.png',
                    title: 'Balus Cup',
                    description: 'Pistachio ice cream',
                    price: '4,99',
                    likes: '120',
                    icon: Icons.favorite),
                SizedBox(width: 10),
                MyCard2(
                    imagePath: 'assets/images/icecream_stick.png',
                    title: 'Moglis Cup',
                    description: 'Strawberry ice cream',
                    price: '4,99',
                    likes: '120',
                    icon: Icons.favorite),
                SizedBox(width: 10),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
