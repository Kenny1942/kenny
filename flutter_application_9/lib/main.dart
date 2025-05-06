import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/backg.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(255, 231, 154, 154).withOpacity(0.9),
            ),
            Positioned.fill(
              child: Image.asset('assets/images/logo2.png'),
              left: 0,
              top: -450,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 480),
                  Text(
                    'Willkommen bei Iron-Fit',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 15, 1, 1),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bei uns kannst du dein Training verbessern und',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 15, 1, 1),
                    ),
                  ),
                  Text(
                    'vieles mehr',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 15, 1, 1),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(204, 224, 51, 51),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Jetzt anmelden',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 120),
                  Text(
                    'Schon bei IronFit registriert',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 19, 2, 2),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hier einloggen',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 1, 1),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
