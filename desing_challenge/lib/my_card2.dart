import 'package:flutter/material.dart';

class MyCard2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final IconData icon;
  final String likes;

  const MyCard2(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.price,
      required this.icon,
      required this.likes});

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
            Color.fromARGB(255, 120, 115, 115),
            Color(0xFF908CF5),
            Color(0xFF8C5BEA),
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
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(179, 241, 233, 233),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Text(
                    price,
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
                    likes,
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
