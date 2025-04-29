import 'package:desing_challenge/buttons.dart';
import 'package:desing_challenge/card_in_desp_screen.dart';
import 'package:desing_challenge/icons_Details.dart';
import 'package:desing_challenge/screen3.dart';
import 'package:desing_challenge/my_card2.dart';
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
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container1(
                    laenge: 25,
                    text: 'All categories',
                  ),
                  Container1(
                    laenge: 25,
                    text: 'Salty',
                  ),
                  Container1(
                    laenge: 25,
                    text: 'Sweet',
                  ),
                  Container1(
                    laenge: 25,
                    text: 'Pikant',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            right: 20,
            child: Image.asset(
              'assets/images/cut_card.png',
              width: 350,
              height: 350,
            ),
          ),
          Positioned(
            top: 290,
            right: 12,
            child: Image.asset(
              'assets/images/burger.png',
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: 250,
            left: 55,
            child: Text(
              'Angis Yummy Burger',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 285,
            left: 55,
            child: Text(
              'Delish vergan burger\nthat tastes like heaven',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 345,
            left: 55,
            child: Text(
              '13.99',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 395,
            left: 55,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'Add to order',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
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
                MainContainer(
                  description: 'Strawerry ice cream',
                  icon: Icons.favorite,
                  imagePath: 'assets/images/cupcake_chick.png',
                  likes: '5',
                  price: '5.55',
                  title: 'Moglis Cup',
                ),
                SizedBox(width: 10),
                MainContainer(
                  imagePath: 'assets/images/cupkake_cat.png',
                  title: 'Moglis Cup',
                  description: 'Strawberry ice cream',
                  price: '10,99',
                  likes: '120',
                  icon: Icons.favorite,
                ),
                SizedBox(width: 10),
                MainContainer(
                  imagePath: 'assets/images/icecream_cone.png',
                  title: 'Moglis Cup',
                  description: 'Strawberry ice cream',
                  price: '10,99',
                  likes: '120',
                  icon: Icons.favorite,
                ),
                SizedBox(width: 10),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
