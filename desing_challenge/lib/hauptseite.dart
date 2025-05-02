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
                      laenge: 25, text: 'All categories', color2: Colors.white),
                  Container1(
                      laenge: 25,
                      text: 'Salty',
                      color1: const Color.fromARGB(235, 201, 146, 201),
                      color2: const Color.fromARGB(255, 23, 19, 19)),
                  Container1(
                      laenge: 25,
                      text: 'Sweet',
                      color1: const Color.fromARGB(235, 209, 137, 209),
                      color2: Colors.white),
                  Container1(
                      laenge: 25,
                      text: 'Pikant',
                      color1: const Color.fromARGB(235, 209, 137, 209),
                      color2: Colors.white),
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
            child: Row(
              children: [
                Text(
                  'Angis Yummy Burger',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Image.asset(
                  'assets/images/star.png',
                  width: 12,
                  height: 12,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '4.8',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/eeee.png',
                  width: 12,
                  height: 12,
                ),
                Text('13,99',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            top: 395,
            left: 55,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 141, 84, 206),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                    color: const Color.fromARGB(255, 107, 75, 135)
                        .withOpacity(0.5)),
                elevation: 8,
                shadowColor:
                    const Color.fromARGB(255, 134, 108, 187).withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
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
                  icon: 'assets/images/Heart.svg',
                  imagePath: 'assets/images/cupcake_chick.png',
                  likes: '5',
                  price: '5.55',
                  title: 'Moglis Cup',
                  coin: 'assets/images/eeee.png',
                ),
                SizedBox(width: 10),
                MainContainer(
                  imagePath: 'assets/images/cupkake_cat.png',
                  title: 'Charlis Cup',
                  description: 'Delicious cupkake',
                  price: '10,99',
                  likes: '120',
                  icon: 'assets/images/Heart.svg',
                  coin: 'assets/images/eeee.png',
                ),
                SizedBox(width: 10),
                MainContainer(
                  imagePath: 'assets/images/icecream_cone.png',
                  title: 'Kai in a Cone',
                  description: 'Vainilla ice cream',
                  price: '12,99',
                  likes: '10',
                  icon: 'assets/images/Heart.svg',
                  coin: 'assets/images/eeee.png',
                ),
                SizedBox(width: 10),
                MainContainer(
                  imagePath: 'assets/images/icecream.png',
                  title: 'Kai in a Cone',
                  description: 'Vainilla ice cream',
                  price: '7,99',
                  likes: '15',
                  icon: 'assets/images/Heart.svg',
                  coin: 'assets/images/eeee.png',
                ),
                SizedBox(width: 10),
                MainContainer(
                  imagePath: 'assets/images/icecream_stick.png',
                  title: 'Kai in a Cone',
                  description: 'Vainilla ice cream',
                  price: '6,99',
                  likes: '11',
                  icon: 'assets/images/Heart.svg',
                  coin: 'assets/images/eeee.png',
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
