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
            top: 560,
            left: 18,
            child: MyCard2(),
          ),
        ],
      ),
    );
  }
}

class MyCard2 extends StatelessWidget {
  const MyCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.07, 0.61, 1.0],
          colors: [
            Color(0xFFFFFFFF), // blanco
            Color(0xFF908CF5), // lila medio
            Color(0xFF8C5BEA), // violeta fuerte
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen en la parte superior
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'assets/images/cupkake_cat.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Nombre
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Moglis Cup',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Descripción
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                'Strawberry ice cream',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(179, 241, 233, 233),
                ),
              ),
            ),
            Spacer(),
            // Precio y likes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Text(
                    '\$4.99',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: const Color.fromARGB(255, 243, 234, 234),
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '120',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
