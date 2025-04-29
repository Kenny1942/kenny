import 'package:flutter/material.dart';

class IconsDetails extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  // final String price;

  const IconsDetails({
    super.key,
    required this.description,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                image,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            top: 100,
            left: 10,
            //right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                // Puedes agregar más información aquí
              ],
            ),
          ),
        ],
      ),
    );
  }
}
