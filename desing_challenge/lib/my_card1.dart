import 'package:desing_challenge/hauptseite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard1 extends StatelessWidget {
  const MyCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color.fromARGB(255, 155, 147, 147),
          width: 0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 247, 245, 245),
              ),
              "Feeling Snackisch Today?",
            ),
            SizedBox(height: 15),
            Text(
              "Explore Angi's most popular snack selection \n and get instantly happy",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Hauptseite()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 169, 69, 135),
                foregroundColor: const Color.fromRGBO(233, 112, 196, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                shadowColor: const Color.fromARGB(255, 239, 155, 219),
                overlayColor: Color.fromRGBO(220, 93, 188, 0),
                minimumSize: Size(220, 50),
              ),
              child: Text(
                'Order Now',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
