import 'package:desing_challenge/hauptseite.dart';
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
          child: MyCard(),
        ),
      ]),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withValues(alpha: 0.4), // Semi-transparente
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
      ),
      elevation: 8, // Sombra para darle profundidad
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Solo ocupa el espacio necesario
          children: [
            Text(
              "Feeling Snackisch Today?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Explore Angi's most popular snack selection \n and get instantly happy",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
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
                backgroundColor: const Color.fromARGB(255, 124, 54, 104),
                foregroundColor: const Color.fromARGB(255, 235, 226, 226),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}
